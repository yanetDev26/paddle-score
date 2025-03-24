//
//  PaddleScoreMatchHistoryScreen.swift
//  PaddleScore Watch App
//
//  Created by Yanet Rodriguez on 24/03/2025.
//

import SwiftUI
import SwiftData

struct PaddleScoreMatchHistoryScreen: View {
    @Query var matchHistory: [MatchResultModel]
    
    var body: some View {
        NavigationStack {
            List(matchHistory) { match in
                VStack(alignment: .leading, spacing: 2) {
                    Text(match.date, formatter: dateFormatter)
                        .font(.caption2)
                        .foregroundStyle(.gray)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            PaddleScoreTextView(text: "Mi equipo:", foregroundColor: .black)
                            PaddleScoreTextView(text: "Sets: \(match.team1Sets)  Juegos: \(match.team1Games)", foregroundColor: .black)
                        }
                        Spacer()
                        VStack(alignment: .trailing) {
                            PaddleScoreTextView(text: "Oponente:", foregroundColor: .black)
                            PaddleScoreTextView(text: "Sets: \(match.team1Sets)  Juegos: \(match.team1Games)", foregroundColor: .black)
                        }
                    }
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("Historial")
        }
        .background(Color.greenR199g219b156)
    }
}

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .none
    return formatter
}()

#Preview {
    let sampleMatches = [
        MatchResultModel(date: Date(), team1Sets: 2, team2Sets: 1, team1Games: 6, team2Games: 4),
        MatchResultModel(date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, team1Sets: 0, team2Sets: 2, team1Games: 3, team2Games: 6),
        MatchResultModel( date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!, team1Sets: 2, team2Sets: 0, team1Games: 6, team2Games: 2)
    ]
    
    do {
        let container = try ModelContainer(for: MatchResultModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        let context = container.mainContext
        
        sampleMatches.forEach { context.insert($0) }
        
        return PaddleScoreMatchHistoryScreen()
            .modelContainer(container)
            .environment(\.modelContext, context)
    } catch {
        return Text("Error al cargar vista previa")
    }
}
