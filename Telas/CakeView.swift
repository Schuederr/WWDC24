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
    
    @State private var dragOffsets: [CGSize] = Array(repeating: .zero, count: 10)
    @State private var frames: [CGRect] = Array(repeating: .zero, count: 10)
    
    @State var collision = false
    
    @State var oiFrame = CGRect()
    
    let gridItems = [GridItem(), GridItem(), GridItem()]
    
    var body: some View {
        
        ZStack {
            
            Image("tableCake")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    LazyVGrid(columns: gridItems) {
                        ForEach(Array(ingredients.enumerated()), id: \.offset) { index, ingredient in
                            
                            let xOffset = dragOffsets[index].width
                            let yOffset = dragOffsets[index].height
                            
                            Image(ingredient.title)
                                .scaleEffect(0.5)
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
                    
                    ZStack{
                        
                        Image("liquidMaquina")
                            .scaleEffect(0.5)
                        
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
                .shadow(color: .black.opacity(0.25), radius: 2, x: 5, y: 5)
                
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
        }.background(Color("amarelinho"))
    }
        
    
    
    
    private func resetOffsets() {
        dragOffsets = Array(repeating: .zero, count: 10)
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
