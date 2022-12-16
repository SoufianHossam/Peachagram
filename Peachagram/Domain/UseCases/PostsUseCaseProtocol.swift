//
//  PostsUseCase.swift
//  Peachagram
//
//  Created by Soufian Hossam on 16/12/2022.
//

import Foundation

protocol PostsUseCaseProtocol {
    func fetchPosts(completion: @escaping (Result<[Post], Error>) -> Void)
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void)
}

struct PostsUseCase: PostsUseCaseProtocol {
    private let postsRepo: PostsRepositoryProtocol
    
    init(_ postsRepo: PostsRepositoryProtocol = PostsRepository()) {
        self.postsRepo = postsRepo
    }
    
    func fetchPosts(completion: @escaping (Result<[Post], Error>) -> Void) {
        postsRepo.fetchPosts(completion: completion)
    }
    
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        postsRepo.fetchUsers(completion: completion)
    }
}
