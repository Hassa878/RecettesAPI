//
//  RecettesAPIApp.swift
//  RecettesAPI
//
//  Created by konate on 06/11/2026.
//

import SwiftUI
import SwiftData

@main
struct RecettesAPIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: RecetteFavorite.self)
    }
}
