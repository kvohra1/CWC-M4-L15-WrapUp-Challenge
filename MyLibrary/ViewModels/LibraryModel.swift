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
    
    //Create a method that updates the array with the new rating change
    func updateRating(forId:Int, rating:Int)
    {
        if let index = dataWords.firstIndex(where: { $0.id == forId})
        {
            dataWords[index].rating = rating
        }
    }
    
    //Create a method that keeps the current page once the user leaves the screen
    func updatePage(forId:Int, page: Int)
    {
        if let index = dataWords.firstIndex(where: {$0.id == forId})
        {
            dataWords[index].currentPage = page 
        }
        
    }
}
