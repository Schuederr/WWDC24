//
//  AbsolutePosReader.swift
//  wwdc24
//
//  Created by Natalia Schueda on 09/02/24.
//

import SwiftUI

struct AbsoluteFrameReader: View {
    let id: String
    
    var body: some View {
        GeometryReader { g in
            let absoluteFrame = g.frame(in: .named("absoluteFrameReader"))
            
            Rectangle()
                .fill(Color.clear)
                .frame(width: 50, height: 50)
                .preference(
                    key: AbsoluteFrameKey.self,
                    value: [AbsoluteFrameValue(id: id, absoluteFrame: absoluteFrame)]
                )
            
        }
    }
}

struct AbsoluteFrameValue: Equatable {
    let id: String
    let absoluteFrame: CGRect
}

struct AbsoluteFrameKey: PreferenceKey {
    
    typealias Value = [AbsoluteFrameValue]
    static var defaultValue: [AbsoluteFrameValue] = []
    
    static func reduce(value: inout [AbsoluteFrameValue], nextValue: () -> [AbsoluteFrameValue]) {
        value.append(contentsOf: nextValue())
    }
}
