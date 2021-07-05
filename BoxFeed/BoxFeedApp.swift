//
//  BoxFeedApp.swift
//  BoxFeed
//
//  Created by Sameer Nawaz on 06/07/21.
//

import SwiftUI

@main
struct BoxFeedApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
