//
//  AppConfigurations.swift
//  Peachagram
//
//  Created by Soufian Hossam on 02/12/2022.
//

import Foundation

final class AppConfigurations {
    lazy var apiBaseURL: String = {
        guard let apiBaseURL = Bundle.main.object(forInfoDictionaryKey: "ApiBaseURL") as? String else {
            fatalError("ApiBaseURL must not be empty in plist")
        }
        return apiBaseURL
    }()
}
