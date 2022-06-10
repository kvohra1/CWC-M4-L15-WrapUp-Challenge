//
//  BookView.swift
//  MyLibrary
//
//  Created by Karla Vohra on 6/7/22.
//

import SwiftUI

struct BookView: View {
    var dataWords:DataWords
    
    @State var isStarOn = false
    @State var selectedIndex = 1
    

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
                    
                    //MARK: Toggle - Mark for later
                    
                    Text("Mark for Later!")
                        .bold()
                    
                    Toggle(isOn: $isStarOn)
                    {
                        Image(systemName: "star")
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
                    
                    
                }.navigationBarTitle(dataWords.title)
                    .toggleStyle(.button)
            }
            
            
        }
    }
}
struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        let model = LibraryModel()
        
        BookView(dataWords: model.dataWords[0])
    }
}
