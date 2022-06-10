//
//  JSONLoader.swift
//  CoreModule
//
//  Created by Intan Nurjanah on 09/06/22.
//

import Foundation

public struct JSONLoader {
    
    public static func load(fileName: String, bundle: Bundle?) -> Data {
        // read the json file
        guard let path = bundle?.path(forResource: fileName, ofType: "json") else {
            fatalError("Path for \(fileName).json was not found")
        }
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            fatalError("Unable to load data!")
        }
        
        return data
    }
    
}
