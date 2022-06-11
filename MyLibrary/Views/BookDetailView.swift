//
//  BookDetailView.swift
//  MyLibrary
//
//  Created by Karla Vohra on 6/7/22.
//

import SwiftUI

struct BookDetailView: View {
    
    var bookDetail:DataWords
    
    var body: some View {
        
        GeometryReader
        {
            geo in
            TabView
            {
                ForEach(0..<bookDetail.content.count)
                {
                    index in
                    VStack {
                        Text(bookDetail.content[index])
                        
                        Spacer()
                        
                        Text((String(index + 1)))
                    }
                }
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
            
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = LibraryModel()
        
        BookDetailView(bookDetail: model.dataWords[0])
        
        //BookDetailView(bookDetail: "Test1", bookIndex: 1, bookTitle: "Book Title Test")
    }
}
