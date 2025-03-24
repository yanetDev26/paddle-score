//
//  MatchResultModel.swift
//  PaddleScore
//
//  Created by Yanet Rodriguez on 24/03/2025.
//

import SwiftData
import Foundation

@Model
class MatchResultModel {
    var date: Date
        var team1Sets: Int
        var team2Sets: Int
        var team1Games: Int
        var team2Games: Int
        
    init(date: Date, team1Sets: Int, team2Sets: Int, team1Games: Int, team2Games: Int) {
        self.date = date
        self.team1Sets = team1Sets
        self.team2Sets = team2Sets
        self.team1Games = team1Games
        self.team2Games = team2Games
    }
}
