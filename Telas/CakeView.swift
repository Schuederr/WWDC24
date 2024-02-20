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
    
    @State var blenderFrame = CGRect()
    
    @State var moment = Moments.liquids
    
    let gridItems = [GridItem(), GridItem()]
    
    var body: some View {
        
        ZStack {
            
            Image("tableCake")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    LazyVGrid(columns: gridItems) {
                            
                            ForEach(Array(ingredients.enumerated()), id: \.offset) { index, ingredient in
                                
                                let xOffset = dragOffsets[index].width
                                let yOffset = dragOffsets[index].height
                                
                                    Image(ingredient.title)
                                        .scaleEffect(0.5)
                                        .offset(x: xOffset,
                                                y: yOffset)
                                        .frame(width: 50, height: 50)
                                        .padding()
                                        .gesture(DragGesture()
                                            .onChanged { value in
                                                dragOffsets[index] = value.translation
                                                checkCollision(index: index)
                                                if collision == true {
//                                                    resetOffsets()
                                                }
                                            }
                                        )
                                        .overlay(AbsoluteFrameReader(id: "\(index)"))
                            }
                    }
                        
                        
                    ZStack(alignment: .trailing) {
                        
                        Image("liquidMaquina")
                            .scaleEffect(0.5)
                            .opacity(0.2)
                        
                    }
                    .frame(width: 150, height: 320)
                    .background(collision ? .red: .blue)
                    .overlay(AbsoluteFrameReader(id: "blender"))
                }
                
                Button(action: {
                    resetOffsets()
                }, label: {
                    Text("Reset")
                        .foregroundStyle(.black)
                        .background()
                })
                
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
                        if v.id == "blender" {
                            blenderFrame = v.absoluteFrame
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
        
        print("blender frame: \(blenderFrame)")
        print("ingredientFrame: \(ingredientFrame)")
        
        if ingredientFrame.intersects(blenderFrame) {
            collision = true
        }
    }
    
    enum Moments {
        case liquids
        case solids
        case powder
    }
    
}
