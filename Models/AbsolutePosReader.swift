//
//  AbsolutePosReader.swift
//  wwdc24
//
//  Created by Natalia Schueda on 09/02/24.
//

import SwiftUI

struct AbsolutePositionReader: View {
    let id: String
    
    var body: some View {
        GeometryReader { g in
            let absolutePosition = CGPoint(
                x: g.frame(in: .named("AbsolutePositionReader")).minX,
                y: g.frame(in: .named("AbsolutePositionReader")).minY
            )
            
            Rectangle()
                .fill(Color.clear)
                .preference(
                    key: AbsolutePositionKey.self,
                    value: [AbsolutePositionValue(id: id, absolutePosition: absolutePosition)]
                )
            
        }
    }
}

struct AbsolutePositionValue: Equatable {
    let id: String
    let absolutePosition: CGPoint
}

struct AbsolutePositionKey: PreferenceKey {
    
    typealias Value = [AbsolutePositionValue]
    static var defaultValue: [AbsolutePositionValue] = []
    
    static func reduce(value: inout [AbsolutePositionValue], nextValue: () -> [AbsolutePositionValue]) {
        value.append(contentsOf: nextValue())
    }
}
