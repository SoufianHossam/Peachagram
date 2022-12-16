//  
//  FeedViewModel.swift
//  Peachagram
//
//  Created by Soufian Hossam on 16/12/2022.
//

import Foundation
import Combine

// MARK: FeedViewModel
class FeedViewModel {
    private let useCase: PostsUseCaseProtocol
    private let _posts: CurrentValueSubject<[Post], Never> = .init([])
    
    init(_ useCase: PostsUseCaseProtocol = PostsUseCase()) {
        self.useCase = useCase
    }
}

// MARK: FeedViewModelInput
extension FeedViewModel: FeedViewModelInput {
    func fetchPosts() {
        Task {
            do {
                _posts.send(try await useCase.fetchPosts())

            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchUsers() {
    }
}

// MARK: FeedViewModelOutput
extension FeedViewModel: FeedViewModelOutput {
    var posts: AnyPublisher<[Post], Never> {
        _posts.eraseToAnyPublisher()
    }
}
