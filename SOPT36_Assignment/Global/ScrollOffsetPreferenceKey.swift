//
//  ScrollOffsetPreferenceKey.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 6/3/25.
//

import SwiftUI

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: [Int: CGFloat] = [:]
    
    static func reduce(value: inout [Int : CGFloat], nextValue: () -> [Int : CGFloat]) {
        value.merge(nextValue(), uniquingKeysWith: { $1 })
    }
}
