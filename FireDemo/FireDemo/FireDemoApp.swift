//
//  FireDemoApp.swift
//  FireDemo
//
//  Created by トム・クルーズ on 2024/04/12.
//

import SwiftUI
import SwiftData

@main
struct FireDemoApp: App {
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "mainColor") // Set background color
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white] // Set title color to white
        
        // Apply style in iOS 15 or later
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
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
            TextView()
        }
        .modelContainer(sharedModelContainer)
    }
}
