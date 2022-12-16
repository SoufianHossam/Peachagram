//
//  NetworkConfigurations.swift
//  Peachagram
//
//  Created by Soufian Hossam on 03/12/2022.
//

import Foundation

enum NetworkConfigurations {
    static var baseURI: String!
    
    static func set(baseURI: String) {
        self.baseURI = baseURI
    }
}
