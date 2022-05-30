//
//  DBManager.swift
//  CoreModule
//
//  Created by Intan Nurjanah on 30/05/22.
//

import RealmSwift

public class DBManager {
    public var database: Realm
    public static let shared = DBManager()
    
    private init() {
        self.database = try! Realm()
    }
       
    public func deleteAllData()  {
        try! database.write {
            database.deleteAll()
        }
    }
}
