//
//  AnglesRecordApp.swift
//  AnglesRecord
//
//  Created by 광로 on 5/25/25.
//

import SwiftUI
import SwiftData

@main
struct AnglesRecordApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            AudioRecord.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
