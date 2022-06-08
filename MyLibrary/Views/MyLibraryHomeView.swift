//
//  MyLibraryHomeView.swift
//  MyLibrary
//
//  Created by Karla Vohra on 6/7/22.
//

import SwiftUI

struct MyLibraryHomeView: View {
    
    @EnvironmentObject var model:LibraryModel
    
    var body: some View {
        
        NavigationView
        {
            GeometryReader
            {
                geo in
                ScrollView
                {
                    LazyVStack
                    {
                        
                    }
                }
            }
        }
    }
}

struct MyLibraryHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MyLibraryHomeView()
    }
}
