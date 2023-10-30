//
//  TodoeyApp.swift
//  Todoey
//
//  Created by Tatiane Silva on 22/09/23.
//

import SwiftUI
import CoreData

@main
struct TodoeyApp: App {
    
    // Initialize the Core Data stack
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
