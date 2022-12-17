//
//  User + Extensions.swift
//  Peachagram
//
//  Created by Soufian Hossam on 16/12/2022.
//

import Foundation

extension Post {
    init(_ document: Document<PostFields>) {
        self.init(
            mediaType: .init(rawValue: document.fields.mediaType.stringValue) ?? .photo,
            comments: document.fields.comments.arrayValue.values.map { "\($0.stringValue)" },
            authorID: document.fields.authorID.stringValue,
            storageReference: document.fields.storageRef.stringValue,
            caption: document.fields.caption.stringValue,
            creationDate: document.createTime
        )
    }
}
