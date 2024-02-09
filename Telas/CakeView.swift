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
    
    @State var collision = false
    
    let gridItems = [GridItem(), GridItem(), GridItem()]
    
    var body: some View {
        
        VStack {
            HStack {
                Text("fazer o bolo").padding()
                NavigationLink("Ir para tela final", destination: FinalView()).padding()
            }

            VStack {
                LazyVGrid(columns: gridItems) {
                    
                    ForEach(Array(ingredients.enumerated()), id: \.offset) { index, ingredient in
                        
                        let xOffset = positions[index].width + dragOffsets[index].width
                        let yOffset = positions[index].height + dragOffsets[index].height
                        
                        Text(ingredient.title)
                            .padding()
                            .offset(x: xOffset,
                                        y: yOffset)
                                .gesture(DragGesture()
                                    .onChanged { value in
                                        dragOffsets[index] = value.translation
                                        checkCollision(index: index)
                                    }
                                )
                            }
                }
            }
            
            VStack{
                Text("oi?")
            }
            .frame(width: 100, height: 100)
            .background(collision ? .red: .blue)
            
            Button("Reset") {
                resetOffsets()
            }.padding()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    private func resetOffsets() {
        dragOffsets = Array(repeating: .zero, count: 6)
        positions = Array(repeating: .zero, count: 6)
        collision = false
    }
    
    private func checkCollision(index: Int) {
            let ingredientFrame = CGRect(
                x: positions[index].width + dragOffsets[index].width,
                y: positions[index].height + dragOffsets[index].height,
                width: 50,
                height: 50)

            let oiTextFrame = CGRect(
                x: 100,
                y: 100,
                width: 100,
                height: 100
            )

            if ingredientFrame.intersects(oiTextFrame) {
                collision = true
                print("colidiu")
//                resetOffsets()
            }
   
    }
    
}
