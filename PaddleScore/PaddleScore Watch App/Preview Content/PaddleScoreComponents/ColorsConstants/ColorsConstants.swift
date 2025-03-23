//
//  ColorsConstants.swift
//  PaddleScore Watch App
//
//  Created by Yanet Rodriguez on 23/03/2025.
//

import SwiftUI

extension Color {
    static let greenR137g172b70 = colorRGB(r: 137, g: 172, b: 70, a: 1.0)
    static let greenR211g230b113a10 = colorRGB(r: 211, g: 230, b: 113, a: 0.1)
    static let redR255g137b137 = colorRGB(r: 255, g: 137, b: 137, a: 1.0)
    static let yellowR248g237b140 = colorRGB(r: 248, g: 237, b: 140, a: 1.0)

    static func colorRGB(r: Double, g: Double, b: Double, a: Double) -> Color {
        return Color(red: r/255, green: g/255, blue: b/255, opacity: a)
    }
}
