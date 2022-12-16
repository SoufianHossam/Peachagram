//
//  PostsRepositoryProtocol.swift
//  Peachagram
//
//  Created by Soufian Hossam on 16/12/2022.
//

import Foundation

protocol PostsRepositoryProtocol {
    func fetchPosts() async throws -> [Post]
    func fetchUsers() async throws -> [User]
}
