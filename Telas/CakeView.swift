//
//  CakeView.swift
//  WWDC24
//
//  Created by Natalia Schueda on 05/02/24.
//

import SwiftUI

struct CakeView: View {
    
    @State var ingredients = Ingredient.populateIngredients()
    
    @State private var dragOffsets: [CGSize] = Array(repeating: .zero, count: 10)
    @State private var positions: [CGSize] = Array(repeating: .zero, count: 10)
    
    var body: some View {
        
        VStack {
            Text("fazer o bolo").padding()
            NavigationLink("Ir para tela final", destination: FinalView()).padding()
            
            HStack {
                ForEach(Array(ingredients.enumerated()), id: \.offset) { index, ingredient in
                    Text(ingredient.title)
                        .padding()
                        .offset(x: positions[index].width + dragOffsets[index].width,
                                    y: positions[index].height + dragOffsets[index].height)
                            .gesture(DragGesture()
                                .onChanged { value in
                                    dragOffsets[index] = value.translation
                                })
                        }
                }
            
            Button("Reset") {
                resetOffsets()
            }.padding()
        }
    }

    private func resetOffsets() {
        dragOffsets = Array(repeating: .zero, count: 6)
        positions = Array(repeating: .zero, count: 6)
    }
    
}
