//
//  FeedView.swift
//  Peachagram
//
//  Created by Soufian Hossam on 16/12/2022.
//

import SwiftUI
import Combine
import AVKit

struct FeedView<ViewModel: FeedViewModelType>: View {
    @ObservedObject private var viewModel: ViewModel
    @State private var selectedItem: SelectedItem?
    private let storageManager = StorageManager()
    
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

struct PostView: View {
    @State var postViewModel: PostViewModel
    @State var data: Data?
    @State var commentAction: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack(spacing: 4) {
                Image(systemName: "person.crop.circle")
                Text(postViewModel.userName)
                    .font(.footnote)
                    .fontWeight(.semibold)
                Spacer()
                Text(postViewModel.creationDate)
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .padding(.trailing, 4)
            }
            .padding(.leading, 4)
            
            if data == nil {
                Image("placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
            } else if postViewModel.mediaType == .photo {
                Image(uiImage: .init(data: data!)!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
            } else {
                let url = FileManager.default.urls(for: .documentDirectory,
                                                   in: .userDomainMask).first!.appendingPathComponent("\(postViewModel.id).mp4")
                if let _ = try? data?.write(to: url) {
                    VideoPlayer(player: .init(url: url))
                        .aspectRatio(contentMode: .fit)
                }
            }
            
            HStack {
                Text(postViewModel.caption)
                    .font(.subheadline)
                Spacer()
                Button(action: commentAction) {
                    Image(systemName: "ellipses.bubble.fill")
                        .foregroundColor(.black)
                }
                .opacity(postViewModel.comments.isEmpty ? 0.4 : 1)
                .disabled(postViewModel.comments.isEmpty)
            }
            .padding([.leading, .trailing], 4)
        }
        .padding([.top, .bottom], 4)
        .onAppear {
            Task {
                let storageManager = StorageManager()
                data = await storageManager.fetchData(for: postViewModel.storageReference)
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(viewModel: FeedViewModel())
    }
}
