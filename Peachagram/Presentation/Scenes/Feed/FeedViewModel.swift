//  
//  FeedViewModel.swift
//  Peachagram
//
//  Created by Soufian Hossam on 16/12/2022.
//

import Foundation
import Combine

@MainActor
class FeedViewModel: ObservableObject {
    private let useCase: PostsUseCaseProtocol
    @Published var postsViewModels: [PostViewModel] = []
    
    init(_ useCase: PostsUseCaseProtocol = PostsUseCase()) {
        self.useCase = useCase
    }
}

extension FeedViewModel: FeedViewModelInput, FeedViewModelOutput {
    func fetchPosts() {
        Task {
            do {
                let posts = try await useCase.fetchPosts()
                let users = try await useCase.fetchUsers()
                    
                postsViewModels = posts.map { post in
                    PostViewModel(
                        mediaType: post.mediaType,
                        comments: post.comments,
                        userName: users.filter { $0.id == post.authorID }.first!.name,
                        storageReference: post.storageReference,
                        caption: post.caption,
                        creationDate: post.creationDate.asString
                    )
                }
                
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
