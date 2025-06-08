//
//  ContentView.swift
//  Matrix
//
//  Created by Chhailong Sann on 29-05-2025.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        List {
            Section {
                RippleMetricView(numberOfColumns: 15, numberOfRows: 7, spacing: 10)
            }
            Section {
                RippleMetricView(numberOfColumns: 20, numberOfRows: 7, spacing: 4)
                    .tint(.red)
            }
            Section {
                RippleMetricView(numberOfColumns: 15, numberOfRows: 7, spacing: 4)
            }
            Section {
                RippleMetricView(numberOfColumns: 30, numberOfRows: 10, spacing: 2)
            }
            Section {
                RippleMetricView(numberOfColumns: 21, numberOfRows: 3, spacing: 2)
            }
        }
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
