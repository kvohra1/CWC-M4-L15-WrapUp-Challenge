//
//  DataServices.swift
//  MyLibrary
//
//  Created by Karla Vohra on 6/7/22.
//

import Foundation

class DataServices
{
    static func getLocalData () -> [DataWords]
    {
        //MARK: Step 1 - Get the pathString to the json file using the Bundle class
        let pathString = Bundle.main.path(forResource: "Data", ofType: "json")
        
        
        //MARK: Step 2 - Check if pathString is nil
        guard pathString != nil else
        {
            return [DataWords]()
        }
        
        //MARK: Step 3 - Create the URL using the URL class
        let url = URL(fileURLWithPath: pathString!)
        
        //MARK: Step 4 and Step 5 - Create the Data Object (instance of data) using the Data class and Error Handling
        
       do
       {
           let data = try Data(contentsOf: url)
           //MARK: Step 6 - Add Decodable protocol to the DataWords.swift file
           
           //MARK: Step 7 - Decode the data using JSON Decoder class
           
           let decoder = JSONDecoder()
           do
           {
               let wordData = try decoder.decode([DataWords].self, from: data)
               
               //MARK: Step 8 - Don't need to add unique IDs because we already have it in our data file
               //MARK: Step 9 - Return the list of DataWords
               return wordData
           }
           catch
           {
               print ("Error parsing the data")
           }
           
       }
        catch
        {
            print ("Error fetching the data")
        }
      
            
       
        
        return [DataWords]()
    }
    
    
}
