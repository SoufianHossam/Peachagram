//
//  Response DTOs.swift
//  Peachagram
//
//  Created by Soufian Hossam on 16/12/2022.
//

import Foundation

// MARK: - Response
struct Response<T: Decodable>: Decodable {
    let documents: [Document<T>]
}

// MARK: - Document
struct Document<T: Decodable>: Decodable {
    let name: String
    let fields: T
    let createTime: Date
}

// MARK: - PostFields
struct PostFields: Decodable {
    let mediaType: FieldValue
    let comments: Comments
    let authorID, storageRef, caption: FieldValue
}

// MARK: - UserFields
struct UserFields: Decodable {
    let email, username: FieldValue
}

// MARK: - AuthorID
struct FieldValue: Decodable {
    let stringValue: String
}

// MARK: - Comments
struct Comments: Decodable {
    let arrayValue: ArrayValue
}

// MARK: - ArrayValue
struct ArrayValue: Decodable {
    let values: [FieldValue]
}
