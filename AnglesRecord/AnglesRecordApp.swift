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
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var sharedModelContainer: ModelContainer = {
        let schema = Schema([ AudioRecord.self ])
        let config = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        return try! ModelContainer(for: schema, configurations: [config])
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
