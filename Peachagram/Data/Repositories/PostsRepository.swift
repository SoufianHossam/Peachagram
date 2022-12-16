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
    
    func fetchPosts() async throws -> [Post] {
        let request = Endpoints.posts()
        let response = try await networkClient.request(request)
        return response.documents.map(Post.init)
    }
    
    func fetchUsers() async throws -> [User] {
        let request = Endpoints.users()
        let response = try await networkClient.request(request)
        return response.documents.map(User.init)
    }
}
