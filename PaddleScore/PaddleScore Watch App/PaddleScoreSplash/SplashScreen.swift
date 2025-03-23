//
//  SplashScreen.swift
//  PaddleScore Watch App
//
//  Created by Yanet Rodriguez on 23/03/2025.
//

import SwiftUI

struct SplashScreen: View {
    @State private var bounce = false
    @Binding var isActive: Bool
    
    var body: some View {
        VStack {
            Image("tennis_ball")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .offset(y: bounce ? -20 : 20)
                .animation(Animation.easeInOut(duration: 0.5).repeatForever(), value: bounce)
                .onAppear { bounce.toggle() }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isActive = false
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen(isActive: .constant(true))
    }
}
