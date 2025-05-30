//
//  ContentView.swift
//  Matrix
//
//  Created by Chhailong Sann on 29-05-2025.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        RippleMetricView(numberOfColumns: 13, spacing: 10)
            .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}

extension Color {
    static var random: Color {
            Color(
                red: .random(in: 0...1),
                green: .random(in: 0...1),
                blue: .random(in: 0...1)
            )
        }
}
