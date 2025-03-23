//
//  PaddleScore.swift
//  PaddleScore
//
//  Created by Yanet Rodriguez on 23/03/2025.
//

import SwiftUI

struct PaddleScoreWinnerScreen: View {
    let winner: String
    
    var body: some View {
        ZStack {
            Color(Color.greenR199g219b156)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                PaddleScoreTextView(text: "\(winner) ¡Ha ganado el set!", foregroundColor: .black)
                    .bold()
                    .frame(maxHeight: .infinity)
                
                Button(action: {
                }) {
                    PaddleScoreTextView(text: "¡Continuar!", foregroundColor: .white)
                        .frame(maxWidth: .infinity)
                        .padding(12)
                        .background(Color.purpleR170g96b200)
                        .cornerRadius(30)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding()
        }
    }
}

#Preview {
    PaddleScoreWinnerScreen(winner: "Yanet")
}
