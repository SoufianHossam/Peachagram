//
//  PostsUseCase.swift
//  Peachagram
//
//  Created by Soufian Hossam on 16/12/2022.
//

import Foundation

protocol PostsUseCaseProtocol {
    func fetchPosts() async throws -> [Post]
    func fetchUsers() async throws -> [User]
}

struct PostsUseCase: PostsUseCaseProtocol {
    private let postsRepo: PostsRepositoryProtocol
    
    init(_ postsRepo: PostsRepositoryProtocol = PostsRepository()) {
        self.postsRepo = postsRepo
    }
    
    func fetchPosts() async throws -> [Post] {
        try await postsRepo.fetchPosts()
    }
    
    func fetchUsers() async throws -> [User] {
        try await postsRepo.fetchUsers()
    }
}
