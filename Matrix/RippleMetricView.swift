//
//  RippleMetricView.swift
//  Matrix
//
//  Created by Chhailong Sann on 29-05-2025.
//

import SwiftUI


fileprivate func calculateDistance(point1: CGPoint, point2: CGPoint) -> Double {
    return hypot(point2.x - point1.x, point2.y - point1.y)
}


fileprivate enum CellAnimationPhase: CaseIterable {
    case identity
    case compress
    case expand
    
    var scaleAdjustment: Double {
        switch self {
        case .identity: 0.0
        case .compress: -0.25
        case .expand: 0.2
        }
    }
    
    var brightnessAdjustment: Double {
        switch self {
        case .identity: 0.0
        case .compress: 0.0
        case .expand: -0.2
        }
    }
}
public struct RippleMetricView: View {
    
    let numberOfColumns: Int
    let spacing: CGFloat
    
    
    @State private var trigger: Int = 0
    @State private var waveOrigin: CGPoint = .zero
    
    public var body: some View {
        GeometryReader {
            let size = $0.size
            let totalSpacing = CGFloat(numberOfColumns - 1) * spacing
            let itemSize = (size.width - totalSpacing) / CGFloat(numberOfColumns)
            let numberOfRows = (size.height + spacing) / (itemSize + spacing)
            
            let MAX_GRID_DISTANCE = calculateDistance(
                point1: .init(x: 0, y: 0),
                point2: .init(x: numberOfColumns - 1, y: Int(numberOfRows - 1))
            )

            
            
            VStack(spacing: spacing) {
                ForEach(1...Int(numberOfRows + 1), id: \.self) { i in
                    HStack(spacing: spacing) {
                        ForEach(1...numberOfColumns, id: \.self) { j in
                            let cellCoordinates = CGPoint(
                                x: Double(j),
                                y: Double(i)
                            )
                            let originDistance = calculateDistance(
                                point1: waveOrigin,
                                point2: cellCoordinates
                            )
                            let originDistanceNormalize = originDistance / MAX_GRID_DISTANCE
                            let waveImpact = pow(1.0 - originDistanceNormalize, 0)
                            
                            RoundedRectangle(cornerRadius: 0)
                                .fill(Color.blue)
                                .frame(width: abs(itemSize), height: abs(itemSize))
                                .phaseAnimator(
                                    CellAnimationPhase.allCases,
                                    trigger: trigger
                                ) { content, phase in
                                    content
                                        .scaleEffect(1.0 + phase.scaleAdjustment * waveImpact)
                                        .brightness(phase.brightnessAdjustment * waveImpact)
                                } animation: { phase in
                                    switch phase {
                                    case .identity: .bouncy(duration: 0.4, extraBounce: 0.35)
                                    case .compress: .smooth(duration: 0.2).delay(0.07 * originDistance)
                                    case .expand: .smooth(duration: 0.1)
                                    }
                                }
                                .onTapGesture {
                                    waveOrigin = cellCoordinates
                                    trigger += 1
                                }
                        }
                    }
                }
            }
        }
    }
}
