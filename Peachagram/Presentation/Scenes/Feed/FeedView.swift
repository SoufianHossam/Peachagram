//
//  FeedView.swift
//  Peachagram
//
//  Created by Soufian Hossam on 16/12/2022.
//

import SwiftUI
import FirebaseStorage

struct FeedView: View {
    @State var data: Data = Data()

    private let viewModel: FeedViewModelType

    init(viewModel: FeedViewModelType) {
        self.viewModel = viewModel
    }
    
    func load() {
        let storage = Storage.storage()
        storage.reference().child("IR942k6vHX9HlvnZyqhB/5llHGnixjuwLK6b02Rt9").getData(maxSize: .max) { [self] data, error in
            self.data = data!
        }
    }
    
    var body: some View {
        Image(uiImage: UIImage(data: data) ?? UIImage())
            .resizable()
            .onAppear() {
                
            }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(viewModel: FeedViewModel())
    }
}
