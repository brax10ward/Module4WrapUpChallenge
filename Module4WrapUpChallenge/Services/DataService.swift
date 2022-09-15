//
//  DataService.swift
//  Module4WrapUpChallenge
//
//  Created by Braxton Ward on 9/14/22.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Book] {
        // Parse local json file
        
        // get a url path to the json file
        let pathString = Bundle.main.path(forResource: "Data", ofType: "json")
        
        // check if pathstring is not nil, otherwise
        guard pathString != nil else {
            return [Book]()
        }
        
        // create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // create a data object
            let data = try Data(contentsOf: url)
            
            // decode the json data
            let decoder = JSONDecoder()
            
            do {
                let bookData = try decoder.decode([Book].self, from: data)
                
                return bookData
            } catch {
                print(error)
            }
        } catch {
            print(error)
        }
        
        return [Book]()
    }
    
}
