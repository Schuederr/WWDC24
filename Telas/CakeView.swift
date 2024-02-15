//
//  CakeView.swift
//  WWDC24
//
//  Created by Natalia Schueda on 05/02/24.
//

import SwiftUI

struct CakeView: View {
    
    // falta: botao reset e fazer detectar o frame e nao o ponto
    
    @State var ingredients = Ingredient.populateIngredients()
    
    @State private var dragOffsets: [CGSize] = Array(repeating: .zero, count: 4)
    @State private var positions: [CGPoint] = Array(repeating: .zero, count: 4)
    
    @State var collision = false
    
    @State var oiFrame = CGRect()
    
    let gridItems = [GridItem(), GridItem(), GridItem()]
    
    var body: some View {
        
        VStack {
            HStack {
                Text("fazer o bolo").padding()
                NavigationLink("bota bolo na forma", destination: PourCakeView()).padding()
            }
            
            VStack {
                LazyVGrid(columns: gridItems) {
                    ForEach(Array(ingredients.enumerated()), id: \.offset) { index, ingredient in
                            
                            let xOffset = dragOffsets[index].width
                            let yOffset = dragOffsets[index].height
                            
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
                                .overlay(AbsolutePositionReader(id: "\(index)"))
                    }
                }
                
                VStack{
                    Text("oi")
                }
                .frame(width: 100, height: 100)
                .overlay(AbsolutePositionReader(id: "oi"))
                .background(collision ? .red: .blue)
            }
            
            Button("Reset") {
                resetOffsets()
            }.padding()
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .coordinateSpace(name: "AbsolutePositionReader")
        .onPreferenceChange(AbsolutePositionKey.self, perform: { value in
            for v in value {
                if let i = Int(v.id) {
                    positions[i] = v.absolutePosition
                }
                if v.id == "oi" {
                    oiFrame = CGRect(x: v.absolutePosition.x, y: v.absolutePosition.y, width: 100, height: 100)
                }
            }
        })
    }
    
    private func resetOffsets() {
        dragOffsets = Array(repeating: .zero, count: 6)
        positions = Array(repeating: .zero, count: 6)
        collision = false
    }
    
    private func checkCollision(index: Int) {
        let ingredientFrame = CGRect(
            x: positions[index].x + dragOffsets[index].width,
            y: positions[index].y + dragOffsets[index].height,
            width: 10,
            height: 10
        )
        
        print("oi frame x: \(oiFrame.minX) y: \(oiFrame.minY)")
        print(oiFrame)
        print("ingredientFrame x: \(ingredientFrame.minX) y: \(ingredientFrame.minY)")
        
        if ingredientFrame.intersects(oiFrame) {
            collision = true
            
        }
        
    }
    
}
