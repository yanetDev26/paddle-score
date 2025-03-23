//
//  PaddleScoreHomeScreen.swift
//  PaddleScore Watch App
//
//  Created by Yanet Rodriguez on 23/03/2025.
//

import SwiftUI

struct PaddleScoreHomeScreen: View {
    @State private var navigateToScore = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color(Color.greenR199g219b156)
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 16) {
                    Image("tennis_ball")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90, height: 90)
                    
                    PaddleScoreTextView(text: "Paddle Score", foregroundColor: .black)
                    
                    NavigationLink(value: true) {
                        PaddleScoreTextView(text: "Comenzar Partido", foregroundColor: .white)
                            .frame(maxWidth: .infinity)
                            .padding(16)
                            .background(Color.purpleR170g96b200)
                            .cornerRadius(30)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .navigationDestination(isPresented: $navigateToScore) {
                    PaddleScoreMatchScreen()
                }
            }
        }
    }
}

#Preview {
    PaddleScoreHomeScreen()
}
