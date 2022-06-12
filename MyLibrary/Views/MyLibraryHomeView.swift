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
            GeometryReader {geo in
                ScrollView
                {
                    LazyVStack()
                    {
                        ForEach(model.dataWords)
                        {
                            book in
                            
                            ZStack
                            {
                                Rectangle()
                                    .foregroundColor(.white)
                                
                                VStack(alignment: .leading)
                                {
                                    Text(book.title)
                                        .font(.title)
                                        .bold()
                
                                    Text(book.author)
                                    NavigationLink {
                                        BookView(dataWords: book)
                                    } label: {
                                        Image("cover\(String(book.id))")
                                            .resizable()
                                    }
                                    
                                }.padding()
                                    //.navigationBarTitle("My Library")
                            }
                            .frame(width: geo.size.width-40, height: geo.size.height - 115, alignment: .center)
                            .cornerRadius(15)
                            .padding(.bottom, 15)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.2), radius: 5, x: -3, y: 3)
                            //.navigationBarTitle("My Library")
                            
                        }//.navigationBarTitle("My Library")
                    }
                    
                }.navigationBarTitle("My Library")
                    .padding()
            }//.navigationBarTitle("My Library")
            
        }
        
    }
}

struct MyLibraryHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MyLibraryHomeView().environmentObject(LibraryModel())
    }
}
