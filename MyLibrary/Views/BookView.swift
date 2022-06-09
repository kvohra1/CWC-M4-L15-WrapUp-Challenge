//
//  BookView.swift
//  MyLibrary
//
//  Created by Karla Vohra on 6/7/22.
//

import SwiftUI

struct BookView: View {
    var dataWords:DataWords
    
   
    
    var body: some View {
        GeometryReader{geo in
            ScrollView
            {
                LazyVStack(alignment: .center)
                {
                    //MARK: Book Title
                    Text("Read Now!")
                        .font(.title)
                    
                    Divider()
                    
                    //MARK: Book Image
                    Image("cover\(String(dataWords.id))")
                        .resizable()
                        .frame(width: geo.size.width-150, height: geo.size.height - 400, alignment: .center)
                    
                }
                
                
                
                
                
                
            }.navigationBarTitle(dataWords.title)
        }
        
        
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        let model = LibraryModel()
        
        BookView(dataWords: model.dataWords[0])
    }
}
