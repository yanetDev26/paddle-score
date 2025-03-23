//
//  PaddleScoreTextView.swift
//  PaddleScore Watch App
//
//  Created by Yanet Rodriguez on 23/03/2025.
//

import SwiftUI

struct PaddleScoreTextView: View {
    var text: String
    var foregroundColor: Color
    
    var body: some View {
        Text(text)
            .font(ConstantsFonts.robotoRegular16)
            .foregroundColor(foregroundColor)
    }
}

#Preview {
    PaddleScoreTextView(text: "Paddle Score", foregroundColor: .white)
}
