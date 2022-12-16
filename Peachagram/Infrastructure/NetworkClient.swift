//
//  NetworkService.swift
//  Peachagram
//
//  Created by Soufian Hossam on 03/12/2022.
//

import Foundation

protocol NetworkClientProtocol {
    func request<T>(_ request: Request<T>) async throws -> T
}

struct NetworkClient: NetworkClientProtocol {
    func request<T>(_ request: Request<T>) async throws -> T {
        let urlRequest = try request.asURLRequest()
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard let response = response as? HTTPURLResponse,
                  (200...299).contains(response.statusCode) else {
                throw handleErrorStatusCode(response)
            }
            
            guard !data.isEmpty else {
                throw NetworkError.noData
            }
            
            #if DEBUG
            print(String(data: data, encoding: .utf8)!)
            #endif
            
            do {
                return try request.parse(data)
                
            } catch {
                throw NetworkError.parsing(error)
            }
            
        } catch {
            throw resolve(error: error)
        }
    }
    
    private func resolve(error: Error) -> NetworkError {
        let code = URLError.Code(rawValue: (error as NSError).code)
        
        switch code {
        case .notConnectedToInternet:
            return .noInternetConnection
            
        default:
            return .networkFailure(error.localizedDescription)
        }
    }
    
    private func handleErrorStatusCode(_ response: URLResponse?) -> NetworkError {
        guard let response = response as? HTTPURLResponse else {
            return NetworkError.networkFailure("No Response")
        }
        
        switch response.statusCode {
        case 400:
            return NetworkError.badRequest
            
        case 401:
            return NetworkError.unauthorized
            
        case 404:
            return NetworkError.notFound
            
        case 429:
            return NetworkError.tooManyRequests
            
        case _ where response.statusCode >= 500:
            return NetworkError.serverError
            
        default:
            return NetworkError.networkFailure("Unknown status code")
        }
    }
}
