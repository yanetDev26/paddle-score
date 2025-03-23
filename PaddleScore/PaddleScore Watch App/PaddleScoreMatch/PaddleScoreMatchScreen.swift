//
//  ContentView.swift
//  PaddleScore Watch App
//
//  Created by Yanet Rodriguez on 23/09/2024.
//

import SwiftUI

struct PaddleScoreMatchScreen: View {
    @StateObject private var viewModel = PaddleScoreViewModel()
    
    var body: some View {
        VStack {
            HStack {
                PaddleScorePointsView(teamName: "Equipo 1", points: viewModel.team1Points, games: viewModel.team1Games, sets: viewModel.team1Sets)
                
                Divider()
                    .frame(width: 2)
                    .background(Color.black)
                
                PaddleScorePointsView(teamName: "Equipo 2", points: viewModel.team2Points, games: viewModel.team2Games, sets: viewModel.team2Sets)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.lightBlueR119g205b255)
            
            HStack {
                Button(action: {
                    viewModel.addPoint(to: 1)
                }) {
                    PaddleScoreTextView(text: "+15", foregroundColor: .white)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(16)
                        .background(Color.purpleR170g96b200)
                        .cornerRadius(30)
                }
                .buttonStyle(PlainButtonStyle())
                
                Button(action: {
                    viewModel.addPoint(to: 2)
                }) {
                    PaddleScoreTextView(text: "+15", foregroundColor: .white)
      
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(16)
                        .background(Color.purpleR170g96b200)
               
                        .cornerRadius(30)
                }
                .buttonStyle(PlainButtonStyle())
            }
            
            Button(action: {
                viewModel.undoLastPoint()
            }) {
                PaddleScoreTextView(text: "Deshacer", foregroundColor: .black)
                    .frame(maxWidth: .infinity)
                    .padding(16)
                    .background(Color.grayR173g178b212)
                    .cornerRadius(30)
            }
            .buttonStyle(PlainButtonStyle())
            .disabled(viewModel.team1Points == 0 && viewModel.team2Points == 0)
        }
        .background(Color.greenR199g219b156)
    }
}

struct PaddleScorePointsView: View {
    let teamName: String
    let points: Int
    let games: Int
    let sets: Int
    
    var body: some View {
        VStack {
            PaddleScoreTextView(text: teamName, foregroundColor: .white)
                .fontWeight(.bold)
                .padding(.bottom)
            
            PaddleScoreTextView(text: "Puntos: \(points == 50 ? "Ventaja" : "\(points)")", foregroundColor: .white)
            
            PaddleScoreTextView(text: "Juegos: \(games)", foregroundColor: .white)
            
            PaddleScoreTextView(text: "Sets: \(sets)", foregroundColor: .white)
            
            Spacer()
        }
    }
}

struct PaddleScoreView_Previews: PreviewProvider {
    static var previews: some View {
        PaddleScoreMatchScreen()
    }
}
