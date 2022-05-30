//
//  PrefHelper.swift
//  CoreModule
//
//  Created by Intan Nurjanah on 03/07/21.
//

import Foundation

public struct PrefHelper {
    public static let pref = UserDefaults.standard
    
    public static func saveObject<Object>(key: String, value: Object) throws where Object: Encodable {
        try pref.setObject(value, forKey: key)
        commit()
    }
    
    public static func saveBool(key: String, value: Bool) {
        pref.set(value, forKey: key)
        commit()
    }
    
    public static func saveInt(key: String, value: Int) {
        pref.set(value, forKey: key)
        commit()
    }
    
    public static func saveDouble(key: String, value: Double) {
        pref.set(value, forKey: key)
        commit()
    }
    
    public static func saveString(key: String, value: String) {
        pref.set(value, forKey: key)
        commit()
    }
    
    public static func commit() {
        pref.synchronize()
    }
    
    public static func remove(key: String) {
        pref.removeObject(forKey: key)
    }
    
    public static func getObject<Object>(key: String, castTo type: Object.Type) throws -> Object where Object: Decodable {
        let obj = try pref.getObject(forKey: key, castTo: type)
        return obj
    }
    
    public static func getBool(key: String) -> Bool {
        if pref.bool(forKey: key) {
            return pref.bool(forKey: key)
        }
        return false
    }
    
    public static func getInt(key: String) -> Int {
        return pref.integer(forKey: key)
    }
    
    public static func getDouble(key: String) -> Double {
        return pref.double(forKey: key)
    }
    
    public static func getString(key: String) -> String {
        if let string = pref.string(forKey: key) {
            return string
        }
        return ""
    }
}
