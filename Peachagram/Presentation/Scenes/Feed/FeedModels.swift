//
//  FeedModels.swift
//  Peachagram
//
//  Created by Soufian Hossam on 17/12/2022.
//

import Foundation

struct PostViewModel: Identifiable {
    let id: UUID = UUID()
    let mediaType: Post.MediaType
    let comments: [String]
    let userName: String
    let storageReference: String
    let caption: String
    let creationDate: String
}

struct SelectedItem: Identifiable {
    let id = UUID()
    let comments: [String]
}
