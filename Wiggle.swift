//
//  Wiggle.swift
//  Fubá
//
//  Created by Natalia Schueda on 22/02/24.
//

import SwiftUI

struct Wiggle: ViewModifier {
    @State var isRotating : Bool
    var angle : Angle
    var time : Double

    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(isRotating ? 2 : -2))
            .onAppear {
                withAnimation {
                    isRotating = !isRotating
                }
            }
            .onChange(of: isRotating) { newValue in
                DispatchQueue.main.asyncAfter(deadline: .now() + time) {
                    withAnimation {
                        isRotating = !isRotating
                    }
                }
            }
    }
}

extension View {
    func wiggle(_ left: Bool,  angle: Angle, _ time: Double) -> some View {
        modifier(Wiggle(isRotating: left, angle: angle, time: time))
    }
}
