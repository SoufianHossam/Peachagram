//
//  StorageManager.swift
//  Peachagram
//
//  Created by Soufian Hossam on 17/12/2022.
//

import Foundation
import FirebaseStorage

struct StorageManager {
    private let storage = Storage.storage()
    
    func fetchData(for storageReference: String) async -> Data? {
        await withCheckedContinuation { continuation in
            storage.reference().child(storageReference).getData(maxSize: .max) { data, _ in
                continuation.resume(with: .success(data))
            }
        }
    }
}
