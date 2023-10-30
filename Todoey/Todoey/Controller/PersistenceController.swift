//
//  PersistenceController.swift
//  Todoey
//
//  Created by Tatiane Silva on 26/10/23.
//

import Foundation
import CoreData

class PersistenceController{
    
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Error loading Core Data store: \(error)")
            }
        }
    }
}
