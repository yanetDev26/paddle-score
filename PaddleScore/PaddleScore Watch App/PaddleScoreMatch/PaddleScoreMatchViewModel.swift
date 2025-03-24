//
//  PaddleScoreMatchViewModel.swift
//  PaddleScore Watch App
//
//  Created by Yanet Rodriguez on 23/03/2025.
//

import SwiftData
import Foundation
import SwiftUI

class PaddleScoreViewModel: ObservableObject {
    @Published var team1Points = 0
    @Published var team2Points = 0
    @Published var team1Games = 0
    @Published var team2Games = 0
    @Published var team1Sets = 0
    @Published var team2Sets = 0
    @Published var winner: String?
    
    private var lastPoint: (team: Int, points: Int)?
    private let pointSystem = [0, 15, 30, 40]
    
    @Environment(\.modelContext) var modelContext
    @Query var matchHistory: [MatchResultModel]

    func addPoint(to team: Int) {
        lastPoint = (team, team == 1 ? team1Points : team2Points)
        
        if team == 1 {
            if team1Points == 40 {
                if team2Points == 40 {
                    team1Points = 50
                } else if team1Points == 50 {
                    winGame(winner: 1)
                } else {
                    winGame(winner: 1)
                }
            } else {
                team1Points = nextPoint(current: team1Points)
            }
        } else {
            if team2Points == 40 {
                if team1Points == 40 {
                    team2Points = 50
                } else if team2Points == 50 {
                    winGame(winner: 2)
                } else {
                    winGame(winner: 2)
                }
            } else {
                team2Points = nextPoint(current: team2Points)
            }
        }
    }
    
    private func nextPoint(current: Int) -> Int {
        if let index = pointSystem.firstIndex(of: current), index < pointSystem.count - 1 {
            return pointSystem[index + 1]
        }
        return current
    }
    
    private func winGame(winner: Int) {
        if winner == 1 {
            team1Games += 1
        } else {
            team2Games += 1
        }
        team1Points = 0
        team2Points = 0
        checkSetWin()
    }
    
    private func checkSetWin() {
        if (team1Games >= 6 && team1Games - team2Games >= 2) {
            team1Sets += 1
            winner = "Equipo 1"
            resetGames()
        } else if (team2Games >= 6 && team2Games - team1Games >= 2) {
            team2Sets += 1
            winner = "Equipo 2"
            resetGames()
        }
    }
    
    private func resetGames() {
        team1Games = 0
        team2Games = 0
    }
    
    func undoLastPoint() {
        guard let last = lastPoint else { return }
        if last.team == 1 {
            team1Points = last.points
        } else {
            team2Points = last.points
        }
        lastPoint = nil
    }
    
    func resetWinner() {
        winner = nil
    }
    
    private func saveMatchResult() {
        let newMatch = MatchResultModel(
            date: Date(),
            team1Sets: team1Sets,
            team2Sets: team2Sets,
            team1Games: team1Games,
            team2Games: team2Games
        )
        
        modelContext.insert(newMatch)
    }
}
