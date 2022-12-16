//
//  Post + Extensions.swift
//  Peachagram
//
//  Created by Soufian Hossam on 16/12/2022.
//

import Foundation

extension User {
    init(_ document: Document<UserFields>) {
        self.init(
            id: document.name.components(separatedBy: "/").last ?? "",
            name: document.fields.username.stringValue,
            email: document.fields.email.stringValue
        )
    }
}
