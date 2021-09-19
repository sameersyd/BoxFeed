//
//  BoxFeedApp.swift
//  BoxFeed
//
//  Created by Sameer Nawaz on 06/07/21.
//

import SwiftUI
import CoreData

@main
struct BoxFeedApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistentContainer.viewContext)
        }
    }
    
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "BoxFeed")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
}
