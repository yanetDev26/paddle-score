//
//  PaddleScoreApp.swift
//  PaddleScore Watch App
//
//  Created by Yanet Rodriguez on 23/09/2024.
//

import SwiftUI
import WatchKit
import SwiftData

@main
struct PaddleScore_Watch_AppApp: App {
    @State private var showSplash = true
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([MatchResultModel.self])
        let container = try! ModelContainer(for: schema, configurations: [])
        return container
    }()
    
    var body: some Scene {
        WindowGroup {
            if showSplash {
                PaddleScoreSplashScreen(isActive: $showSplash)
            } else {
                PaddleScoreHomeScreen().modelContainer(sharedModelContainer)
            }
        }
    }
}
