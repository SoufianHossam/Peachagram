//
//  PostsRepository.swift
//  Peachagram
//
//  Created by Soufian Hossam on 16/12/2022.
//

import Foundation

struct PostsRepository: PostsRepositoryProtocol {
    let networkClient: NetworkClientProtocol
    
    init(_ networkClient: NetworkClientProtocol = NetworkClient()) {
        self.networkClient = networkClient
    }
    
    func fetchPosts(completion: @escaping (Result<[Post], Error>) -> Void) {
        let request = Endpoints.posts()
        
        networkClient.request(request) { result in
            switch result {
            case .success(let value):
                completion(.success(value.documents.map(Post.init)))
            
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        let request = Endpoints.users()
        
        networkClient.request(request) { result in
            switch result {
            case .success(let value):
                completion(.success(value.documents.map(User.init)))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
