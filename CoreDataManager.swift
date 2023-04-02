//
//  CoreDataManager.swift
//  mainAxxess
//
//  Created by shaurya on 4/2/23.
//

import CoreData
import SwiftUI

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    static let shared = CoreDataManager()
    
    private init() {
        
        persistentContainer = NSPersistentContainer(name: "mainAxxess")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Failed to initialize Core Data \(error)")
            }
        }
        
    }
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func save() {
          
            if viewContext.hasChanges {
                do {
                    try viewContext.save()
                } catch {
                    // Show some error here
                }
            }
        }
    
}
