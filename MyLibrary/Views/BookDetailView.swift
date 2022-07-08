//
//  BookDetailView.swift
//  MyLibrary
//
//  Created by Karla Vohra on 6/7/22.
//

import SwiftUI
import AVKit

struct BookDetailView: View {
    
    var bookDetail:DataWords
    @EnvironmentObject var model:LibraryModel
    @State var page = 0
    
    var body: some View {
        
        
            
            TabView(selection: $page, content: {
                
                ForEach(bookDetail.content.indices)
                {
                    index in
                    VStack {
                        Text(bookDetail.content[page])
                            .padding([.leading, .trailing], 20)
                        
                        Spacer()
                        
                        Text((String(page + 1)))
                    }.tag(index)
                }
            }).tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .onDisappear {
                    model.updatePage(forId: bookDetail.id, page: page)
                }
               /* .onAppear {
                    page = bookDetail.currentPage
                                        
                }*/
        
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        page = bookDetail.currentPage
                    }
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
