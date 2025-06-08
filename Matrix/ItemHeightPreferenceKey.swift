//
//  ItemHeightPreferenceKey.swift
//  Matrix
//
//  Created by Sann Chhailong on 8/6/25.
//

import SwiftUI
 

struct ItemHeightPreferenceKey: PreferenceKey {
    typealias Value = CGFloat
    static let defaultValue: Value = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}

