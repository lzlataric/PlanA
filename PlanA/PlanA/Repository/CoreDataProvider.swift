//
//  CoreDataProvider.swift
//  PlanA
//
//  Created by Luka on 15.07.2023..
//

import CoreData
import Foundation

class CoreDataProvider: ObservableObject {
    static let shared = CoreDataProvider()
    let persistentContainer : NSPersistentContainer
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "SchoolSubject")
        persistentContainer.loadPersistentStores { desc, error in
            if let error {
                print("CoreDataProvider init ERROR")
            }
        }
    }
}
