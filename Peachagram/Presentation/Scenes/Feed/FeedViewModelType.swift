//  
//  FeedViewModelType.swift
//  Peachagram
//
//  Created by Soufian Hossam on 16/12/2022.
//

import Foundation
import Combine

/// Feed Input & Output
typealias FeedViewModelType = FeedViewModelInput & FeedViewModelOutput

/// Feed ViewModel Input
protocol FeedViewModelInput {
    func fetchPosts()
    func fetchUsers()
}

/// Feed ViewModel Output
protocol FeedViewModelOutput {
    var posts: AnyPublisher<[Post], Never> { get }
}
