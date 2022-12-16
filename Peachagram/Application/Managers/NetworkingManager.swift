//
//  NetworkingManager.swift
//  Peachagram
//
//  Created by Soufian Hossam on 03/12/2022.
//

import Foundation

struct NetworkingManager {
    private let config = AppConfigurations()
    
    func setup() {
        NetworkConfigurations.set(baseURI: config.apiBaseURL)
    }
}
