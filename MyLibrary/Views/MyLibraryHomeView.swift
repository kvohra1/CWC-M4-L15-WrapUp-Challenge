//
//  MyLibraryHomeView.swift
//  MyLibrary
//
//  Created by Karla Vohra on 6/7/22.
//

import SwiftUI

struct MyLibraryHomeView: View {
    
    @ObservedObject var model = LibraryModel()
    
    var body: some View {
        
        Text("Hello, world!")
            .padding()
    }
}

struct MyLibraryHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MyLibraryHomeView()
    }
}
