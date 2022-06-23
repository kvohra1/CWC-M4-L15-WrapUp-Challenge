//
//  BookView.swift
//  MyLibrary
//
//  Created by Karla Vohra on 6/7/22.
//

import SwiftUI

struct BookView: View {
    
    var dataWords:DataWords
    
    @EnvironmentObject var model:LibraryModel
    @State var rating = 2
    
    
    var body: some View {
        
        GeometryReader {geo in
            VStack(alignment:.center, spacing: 20)
            {
                //MARK: Text - Read Now!
                Text("Read Now!")
                    .font(.title)
                    .padding(.top, 30)
                
                //MARK: Book Cover
                NavigationLink(destination: {
                    BookDetailView(bookDetail: dataWords)
                }, label: {
                    Image("cover\(dataWords.id)")
                        .resizable()
                        .frame(width: geo.size.width-250, height: geo.size.height-480, alignment: .center)
                })
                
                //MARK: Text - Mark for later
                Text("Mark for later!")
                    .bold()
        
                //MARK: Button - Mark for later!
                Button {
                    model.updateFavorite(forId: dataWords.id)
                } label: {
                    Image(systemName: dataWords.isFavourite ? "star.fill": "star")
                        .resizable()
                        .foregroundColor(.yellow)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 30, height: 30)
                }
                
                //MARK: Text - Rating + Book Title
                Text("Rate \(dataWords.title)")
                    .bold()
                    .padding(.top, 50)
                
                Picker("Rate Me", selection: $rating) {
                    Text("1").tag(1)
                    Text("2").tag(2)
                    Text("3").tag(3)
                    Text("4").tag(4)
                    Text("5").tag(5)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding([.leading, .trailing], 30)
         
                
            }.navigationTitle(dataWords.title)
                .onChange(of: rating) { newValue in
                    model.updateRating(forId: dataWords.id, rating: rating)
                }
                .onAppear {
                    rating = dataWords.rating
                }
        }
        
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
      
        //Option 1
        let model = LibraryModel()
        BookView(dataWords: model.dataWords[0])
        
        //Option 2
        //BookView(dataWords: DataWords()).environmentObject(LibraryModel())
    }
}
