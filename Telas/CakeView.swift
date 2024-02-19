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
    @State private var frames: [CGRect] = Array(repeating: .zero, count: 4)
    
    @State var collision = false
    
    @State var oiFrame = CGRect()
    
    let gridItems = [GridItem(), GridItem(), GridItem()]
    
    var body: some View {
        
        VStack {
            
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
                            .overlay(AbsoluteFrameReader(id: "\(index)"))
                    }
                }
                
                VStack{
                    Text("oi")
                }
                .frame(width: 100, height: 100)
                .overlay(AbsoluteFrameReader(id: "oi"))
                .background(collision ? .red: .blue)
            }
            
            Button("Reset") {
                resetOffsets()
            }.padding()
            
            VStack(alignment: .trailing) {
                NavigationLink {
                    PourCakeView()
                } label: {
                    Image(systemName: "chevron.right")
                        .foregroundStyle(Color("marrom"))
                        .bold()
                        .font(.title)
                        .frame(width: 75, height: 75)
                        .background(Color("begezinho"))
                }.frame(alignment: .bottom)
                
            }
//            .padding(50)
            .shadow(color: .black.opacity(0.25), radius: 2, x: 5, y: 5)
//            .frame(maxWidth: .infinity, alignment: .bottomTrailing)
//            .frame(maxHeight: .infinity)
//            .offset(CGSize(width: 0, height: 300))
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .coordinateSpace(name: "AbsoluteFrameReader")
        .onPreferenceChange(AbsoluteFrameKey.self, perform: { value in
            for v in value {
                if let i = Int(v.id) {
                    frames[i] = v.absoluteFrame
                }
                if v.id == "oi" {
                    oiFrame = v.absoluteFrame
                }
            }
        })
    }
    
    private func resetOffsets() {
        dragOffsets = Array(repeating: .zero, count: 6)
        collision = false
    }
    
    private func checkCollision(index: Int) {
        let ingredientFrame = frames[index].offsetBy(dx: dragOffsets[index].width, dy: dragOffsets[index].height)
        
        print("oi frame: \(oiFrame)")
        print("ingredientFrame: \(ingredientFrame)")
        
        if ingredientFrame.intersects(oiFrame) {
            collision = true
            
        }
        
    }
    
}
