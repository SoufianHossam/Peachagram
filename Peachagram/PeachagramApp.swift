//
//  PeachagramApp.swift
//  Peachagram
//
//  Created by Soufian Hossam on 13/12/2022.
//

import SwiftUI
import Firebase

@main
struct PeachagramApp: App {
    init() {
        FirebaseApp.configure()
        NetworkingManager().setup()
    }
    
    var body: some Scene {
        WindowGroup {
            FeedView(viewModel: FeedViewModel())
        }
    }
}
