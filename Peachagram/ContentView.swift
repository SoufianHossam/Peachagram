//
//  ContentView.swift
//  Peachagram
//
//  Created by Soufian Hossam on 13/12/2022.
//

import SwiftUI
import FirebaseStorage

struct ContentView: View {
    @State var data: Data?

    var body: some View {
        Image(uiImage: data == nil ? UIImage() : UIImage(data: data!)!)
            .resizable()
            .onAppear() {
                let storage = Storage.storage()
                storage.reference().child("IR942k6vHX9HlvnZyqhB/5llHGnixjuwLK6b02Rt9").getData(maxSize: .max) { [self] data, error in
                    self.data = data
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
