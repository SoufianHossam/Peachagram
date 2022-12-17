//
//  Date + Extensions.swift
//  Peachagram
//
//  Created by Soufian Hossam on 06/12/2022.
//

import Foundation

extension Date {
    var asString: String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: .now)
    }
}
