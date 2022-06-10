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
}
