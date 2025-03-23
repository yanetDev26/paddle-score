//
//  FontsConstants.swift
//  PaddleScore
//
//  Created by Yanet Rodriguez on 23/03/2025.
//

import SwiftUI

struct ConstantsFonts {
    static func customFont(name: String, size: CGFloat, weight: Font.Weight) -> Font {
        if let customFont = UIFont(name: name, size: size) {
            return Font(customFont).weight(weight)
        } else {
            return Font.system(size: size, weight: weight)
        }
    }

    static let robotoRegular16 = customFont(name: "Roboto-Regular", size: 16, weight: .regular)
}
