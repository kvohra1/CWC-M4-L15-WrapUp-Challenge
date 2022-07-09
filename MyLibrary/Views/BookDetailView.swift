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
        
        //let videoHostURL = Constants.videoHostURL
        //let videoFileName = bookDetail.video
        //let id = bookDetail.id
        
        let url = URL(string: Constants.videoHostURL + bookDetail.video)
        let videoRatio: CGFloat = 1080 / 1920
          
            
            TabView(selection: $page, content: {
                GeometryReader{
                    geo in
                    
                    ForEach(bookDetail.content.indices)
                    {
                        index in
                        
                        VStack
                        {
                            
                            if url != nil
                            {
                                 VideoPlayer(player: AVPlayer(url: url!))
                                    .frame(height: geo.size.width * videoRatio)
                            }
                           Text(bookDetail.content[page])
                               // .padding([.leading, .trailing], 20)
                            
                            Spacer()
                            
                            Text((String(page + 1))).multilineTextAlignment(.center)
                            
                        }.tag(index)
                            .padding()
                    }
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
