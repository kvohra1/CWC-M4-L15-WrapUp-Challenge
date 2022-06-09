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
                    LazyVStack
                    {
                        ForEach(0..<model.dataWords.count)
                        {
                            index in
                            
                            ZStack
                            {
                                Rectangle()
                                    .foregroundColor(.white)
                                VStack
                                {
                                    Text(model.dataWords[index].title)
                                    Text(model.dataWords[index].author)
                                    NavigationLink {
                                        Text("Book View")
                                    } label: {
                                        Image("cover\(String(index+1))")
                                            .resizable()
                                    }

                                    
                                        
                                    
                                }.padding()
                            }
                            .frame(width: geo.size.width-40, height: geo.size.height - 115, alignment: .center)
                                .cornerRadius(15)
                                .padding(.bottom, 10)
                                .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.2), radius: 10, x: -5, y: 5)
                                
                                
                            
                        }
                    }
                    
                    
                }.navigationBarTitle("My Library")
            }
        }
        
    }
}

struct MyLibraryHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MyLibraryHomeView().environmentObject(LibraryModel())
    }
}
