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
    var font: Font?
    var fontWeight: Font.Weight?
    
    var body: some View {
        Text(text)
            .font(ConstantsFonts.robotoRegular16)
            .foregroundColor(foregroundColor)
            .font(font ?? ConstantsFonts.robotoRegular16)
            .fontWeight(fontWeight ?? .regular)
    }
}

#Preview {
    PaddleScoreTextView(text: "Paddle Score", foregroundColor: .white)
}
