//
//  ColorsConstants.swift
//  PaddleScore Watch App
//
//  Created by Yanet Rodriguez on 23/03/2025.
//

import SwiftUI

extension Color {
    static let lightBlueR119g205b255 = colorRGB(r: 119, g: 205, b: 255, a: 1.0)
    static let grayR173g178b212 = colorRGB(r: 173, g: 178, b: 212, a: 1.0)
    static let greenR199g219b156 = colorRGB(r: 199, g: 219, b: 156, a: 1.0)
    static let purpleR170g96b200 = colorRGB(r: 170, g: 96, b: 200, a: 1.0)

    static func colorRGB(r: Double, g: Double, b: Double, a: Double) -> Color {
        return Color(red: r/255, green: g/255, blue: b/255, opacity: a)
    }
}
