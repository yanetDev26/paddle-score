//
//  PaddleScoreApp.swift
//  PaddleScore Watch App
//
//  Created by Yanet Rodriguez on 23/09/2024.
//

import SwiftUI
import FirebaseCore
import WatchKit

@main
struct PaddleScore_Watch_AppApp: App {
    @WKExtensionDelegateAdaptor(AppDelegate.self) var delegate
    
    @State private var showSplash = true
    
    var body: some Scene {
        WindowGroup {
            if showSplash {
                SplashScreen(isActive: $showSplash)
            } else {
                PaddleScoreHomeScreen()
            }
        }
    }
}

class AppDelegate: NSObject, WKExtensionDelegate {
    func applicationDidFinishLaunching() {
        FirebaseApp.configure()
    }
}
