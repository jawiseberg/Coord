//
//  CoordApp.swift
//  Coord
//
//  Created by Jake Wiseberg on 11/5/20.
//

import SwiftUI
import FSCalendar
import CoreData

@main
struct CoordApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
