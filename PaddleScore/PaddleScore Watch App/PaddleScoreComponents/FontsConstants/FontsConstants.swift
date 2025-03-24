//
//  FontsConstants.swift
//  PaddleScore
//
//  Created by Yanet Rodriguez on 23/03/2025.
//

import SwiftUI

struct ConstantsFonts {
    static func customFont(name: String, size: CGFloat) -> Font {
        if let customFont = UIFont(name: name, size: size) {
            return Font(customFont)
        } else {
            return Font.system(size: size)
        }
    }

    static let robotoRegular16 = customFont(name: "Roboto-Regular", size: 16)
    
    static let robotoBold16 = customFont(name: "Roboto-Bold", size: 16)
    static let robotoBold22 = customFont(name: "Roboto-Bold", size: 22)
}
