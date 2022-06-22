//
//  LibraryModel.swift
//  MyLibrary
//
//  Created by Karla Vohra on 6/7/22.
//

import Foundation

class LibraryModel:ObservableObject
{
    @Published var dataWords = [DataWords]()
    
    
    init ()
    {
        self.dataWords = DataServices.getLocalData()
    }
    
    //Create a method to toggle between favoriate and not favoriate
    func updateFavorite(forId:Int)
    {
        if let index = dataWords.firstIndex(where: { $0.id == forId})
        {
            dataWords[index].isFavourite.toggle()
        }
    }
}
