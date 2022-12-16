//
//  Post.swift
//  Peachagram
//
//  Created by Soufian Hossam on 16/12/2022.
//

import Foundation

struct Post {
    let mediaType: MediaType
    let comments: [String]
    let authorID: String
    let storageReference: String
    let caption: String
    let creationDate: Date
    
    enum MediaType: String {
        case video, photo
    }
}
