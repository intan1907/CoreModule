//
//  NetworkConfig.swift
//  CoreModule
//
//  Created by Intan Nurjanah on 18/04/22.
//

import Foundation

public class NetworkConfig {
    
    private static func getConfig() -> [String: Any]? {
        var myDict: [String: Any]?
        if let path = Bundle.main.path(forResource: "ServiceConfig", ofType: "plist"),
           let dict = NSDictionary(contentsOfFile: path) as? [String: Any] {
            myDict = dict
        }
        
        return myDict
    }
    
    public static func getBaseUrl() -> String {
        if let config = getConfig() {
            return config["base_url"] as? String ?? ""
        }
        return ""
    }
    
    public static func getApiKey() -> String {
        if let config = getConfig() {
            return config["api_key"] as? String ?? ""
        }
        return ""
    }
    
}

