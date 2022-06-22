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
    

    
   
    @State var selectedIndex = 1
    
    var body: some View {
      
        VStack(alignment:.center, spacing: 40)
        {
            //MARK: Book Title
            Text(dataWords.title)
                .font(.largeTitle)
                .bold()
                .padding(.trailing, 95)
              
          
            //MARK: Text - Read Now!
            Text("Read Now!")
                .font(.title)
            
            
            
            //MARK: Book Cover
            Image("cover\(dataWords.id)")
                .resizable()
                .frame(width: 200, height: 300, alignment: .center)
            
                
           
            
            //MARK: Text - Mark for later
            Text("Mark for later!")
                .bold()
            
          
            
            //MARK: Button - Mark for later!
            Button {
                model.updateFavorite(forId: dataWords.id)
            } label: {
                Image(systemName: dataWords.isFavourite ? "star.fill": "star")
                    .foregroundColor(.yellow)
            }

            //MARK: Text - Rating + Book Title
            Text("Rate \(dataWords.title)")
                .bold()
            
           Spacer()
            
            
            
        
        }
        /*       GeometryReader
         { geo in
         ScrollView
         {
         LazyVStack(alignment: .center, spacing: 0)
         {
         //MARK: Book Title
         Text(dataWords.title)
         .font(.largeTitle)
         .bold()
         .padding(.trailing, 100)
         
         //MARK: Read Me Text
         Text("Read Now!")
         .font(.title)
         
         //MARK: Book Image
         NavigationLink {
         BookDetailView(bookDetail: dataWords)
         } label: {
         Image("cover\(String(dataWords.id))")
         .resizable()
         .frame(width: geo.size.width/2, height: geo.size.height/2, alignment: .center)
         }
         //MARK: Button - Mark for later
         Text("Mark for Later!")
         .bold()
         
         Button {
         if isStarOn == false
         {
         starImage = "star.fill"
         isStarOn = true
         }
         else
         {
         starImage = "star"
         isStarOn = false
         }
         } label: {
         Image(systemName: starImage)
         .foregroundColor(.yellow)
         }
         
         //MARK: Rating
         Text ("Rate \(dataWords.title)")
         .bold()
         Picker("Tap Me", selection: $selectedIndex)
         {
         Text("1").tag(1)
         Text("2").tag(2)
         Text("3").tag(3)
         Text("4").tag(4)
         Text("5").tag(5)
         }.pickerStyle(.segmented)
         
         Text("You have selected \(selectedIndex)")
         }
         
         } //.navigationBarTitle("My Library")
         .frame(width: geo.size.width, height: geo.size.height, alignment: .top)
         
         }*/
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        let model = LibraryModel()
        
        BookView(dataWords: model.dataWords[0])
    }
}
