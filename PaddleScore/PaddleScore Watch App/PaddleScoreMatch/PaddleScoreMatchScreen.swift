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
        VStack() {
            if let winner = viewModel.winner {
                PaddleScoreWinnerScreen(winner: winner)
                    .onTapGesture {
                        viewModel.resetWinner()
                    }
            } else {
                HStack {
                    PaddleScorePointsView(teamName: "Equipo 1", points: viewModel.team1Points, games: viewModel.team1Games, sets: viewModel.team1Sets)
                    
                    Divider()
                        .frame(width: 2)
                        .background(Color.black)
                    
                    PaddleScorePointsView(teamName: "Equipo 2", points: viewModel.team2Points, games: viewModel.team2Games, sets: viewModel.team2Sets)
                }
                .frame(maxWidth: .infinity)
                .background(Color.lightBlueR119g205b255)
                
                
                HStack {
                    Button(action: {
                        viewModel.addPoint(to: 1)
                        checkWinner()
                    }) {
                        PaddleScoreTextView(text: "+15", foregroundColor: .white)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding(10)
                            .background(Color.purpleR170g96b200)
                            .cornerRadius(30)
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: {
                        viewModel.addPoint(to: 2)
                        checkWinner()
                    }) {
                        PaddleScoreTextView(text: "+15", foregroundColor: .white)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding(10)
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
                        .padding(8)
                        .background(Color.grayR173g178b212)
                        .cornerRadius(30)
                }
                .buttonStyle(PlainButtonStyle())
                .disabled(viewModel.team1Points == 0 && viewModel.team2Points == 0)
            }
        }
        .padding()
        .padding(.top, 25)
        .background(Color.greenR199g219b156)
    }

    func checkWinner() {
        if viewModel.team1Sets >= 2 {
            vibrateOnWin()
        } else if viewModel.team2Sets >= 2 {
            vibrateOnWin()
        }
    }

    func vibrateOnWin() {
        let device = WKInterfaceDevice.current()
        device.play(.success)
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
        }
    }
}

struct PaddleScoreView_Previews: PreviewProvider {
    static var previews: some View {
        PaddleScoreMatchScreen()
    }
}
