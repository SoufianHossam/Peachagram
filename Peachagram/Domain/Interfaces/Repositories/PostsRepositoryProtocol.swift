//
//  PostsRepositoryProtocol.swift
//  Peachagram
//
//  Created by Soufian Hossam on 16/12/2022.
//

import Foundation

protocol PostsRepositoryProtocol {
    func fetchPosts(completion: @escaping (Result<[Post], Error>) -> Void)
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void)
}
