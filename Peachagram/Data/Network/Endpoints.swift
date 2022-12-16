//
//  Endpoints.swift
//  Peachagram
//
//  Created by Soufian Hossam on 16/12/2022.
//

import Foundation

enum Endpoints {
    static func posts() -> Request<Response<PostFields>> {
        .init(path: "posts")
    }
    
    static func users() -> Request<Response<UserFields>> {
        .init(path: "users")
    }
}
