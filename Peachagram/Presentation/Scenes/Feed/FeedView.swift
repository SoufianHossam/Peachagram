//
//  FeedView.swift
//  Peachagram
//
//  Created by Soufian Hossam on 16/12/2022.
//

import SwiftUI
import Combine

struct FeedView<ViewModel: FeedViewModelType>: View {
    @ObservedObject private var viewModel: ViewModel
    @State private var selectedItem: SelectedItem?
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(viewModel.postsViewModels) { post in
                    PostView(postViewModel: post) {
                        guard !post.comments.isEmpty else { return }
                        selectedItem = .init(comments: post.comments)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        }
        .sheet(item: $selectedItem) { item in
            List(item.comments, id: \.self) {
                Text($0)
            }
        }
        .onAppear(perform: viewModel.fetchPosts)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(viewModel: FeedViewModel())
    }
}
