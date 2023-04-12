//
//  Bookkeeping_CoreData_App.swift
//  Bookkeeping(CoreData)
//
//  Created by 贺力 on 3/21/23.
//

import SwiftUI

@main
struct Bookkeeping_CoreData_App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
