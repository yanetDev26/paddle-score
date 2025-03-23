//
//  ContentView.swift
//  PaddleScore Watch App
//
//  Created by Yanet Rodriguez on 23/09/2024.
//

import SwiftUI

struct PaddleScoreView: View {
    @StateObject private var viewModel = PaddleScoreViewModel()
    
    var body: some View {
        VStack {
            HStack {
                PaddleScoreMatchView(teamName: "Equipo 1", points: viewModel.team1Points, games: viewModel.team1Games, sets: viewModel.team1Sets)
                PaddleScoreMatchView(teamName: "Equipo 2", points: viewModel.team2Points, games: viewModel.team2Games, sets: viewModel.team2Sets)
            }
            HStack {
                Button("+1 Equipo 1") {
                    viewModel.addPoint(to: 1)
                }
                Button("+1 Equipo 2") {
                    viewModel.addPoint(to: 2)
                }
            }
            Button("Deshacer") {
                viewModel.undoLastPoint()
            }
            .disabled(viewModel.team1Points == 0 && viewModel.team2Points == 0)
        }
    }
}

struct PaddleScoreMatchView: View {
    let teamName: String
    let points: Int
    let games: Int
    let sets: Int
    
    var body: some View {
        VStack {
            Text(teamName)
            Text("Puntos: \(points == 50 ? "Ventaja" : "\(points)")")
            Text("Juegos: \(games)")
            Text("Sets: \(sets)")
        }
    }
}

struct PaddleScoreView_Previews: PreviewProvider {
    static var previews: some View {
        PaddleScoreView()
    }
}
