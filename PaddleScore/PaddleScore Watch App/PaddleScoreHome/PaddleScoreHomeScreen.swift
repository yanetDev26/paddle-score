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
                        .frame(width: 80, height: 80)
                    
                    PaddleScoreTextView(text: "Paddle Score", foregroundColor: .black, font: ConstantsFonts.robotoBold22, fontWeight: .bold)
                    
                    
                    NavigationLink(destination: PaddleScoreMatchScreen(), isActive: $navigateToScore) {
                        PaddleScoreTextView(text: "Comenzar Partido", foregroundColor: .white)
                            .frame(maxWidth: .infinity)
                            .padding(12)
                            .background(Color.purpleR170g96b200)
                            .cornerRadius(30)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding()
                .onTapGesture {
                    navigateToScore = true
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: PaddleScoreMatchHistoryScreen()) {
                        Image(systemName: "clock.arrow.circlepath")
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

#Preview {
    PaddleScoreHomeScreen()
}
