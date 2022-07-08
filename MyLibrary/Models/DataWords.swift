//
//  DataWords.swift
//  MyLibrary
//
//  Created by Karla Vohra on 6/7/22.
//

import Foundation

struct DataWords:Identifiable, Decodable
{
    var title:String
    var author:String
    var isFavourite:Bool
    var currentPage:Int
    var rating:Int
    var id:Int
    var video:String
    var content:[String]
}


