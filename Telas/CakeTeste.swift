import SwiftUI

struct CakeTeste: View {
    
    // falta: botao reset e fazer detectar o frame e nao o ponto
    
    @State var ingredients = Ingredient.populateIngredients()
    @State private var dragOffsets: [CGSize] = Array(repeating: .zero, count: 10)
    @State private var frames: [CGRect] = Array(repeating: .zero, count: 10)
    @State var collisions: [Bool] = Array(repeating: false, count: 10)
    @State var blenderFrame = CGRect()
    
    @State var liquidsInBlender: Int = 0
    @State var solidsInBlender: Int = 0
    @State var powderInBlender: Int = 0
    
    @State var moment = Moment.liquids
    
    let gridItems = [GridItem(), GridItem()]
    
    enum Moment {
        case liquids
        case solids
        case powder
    }
    
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
                            
                            switch moment {
                                
                            case .liquids:
                                if ingredient.moment == "liquid" && ingredient.isEgg == false {
                                    
                                    Image(collisions[index] ? "xicara" : ingredient.title)
                                        .scaleEffect(0.5)
                                        .offset(x: xOffset,
                                                y: yOffset)
                                        .frame(width: 50, height: 50)
                                        .padding()
                                        .gesture(DragGesture()
                                            .onChanged { value in
                                                dragOffsets[index] = value.translation
                                                checkCollision(index: index)
                                                if collisions[index] == true {
                                                    resetOffsets(index: index)
                                                    liquidsInBlender += 1
                                                    if liquidsInBlender == 5 {
                                                        moment = .solids
                                                    }
                                                }
                                            }
                                        )
                                        .disabled(collisions[index])
                                        .overlay(AbsoluteFrameReader(id: "\(index)"))
                                }
                                
                                if ingredient.moment == "liquid" && ingredient.isEgg == true {
                                    
                                    Image(collisions[index] ? "ovoQuebrado" : ingredient.title)
                                        .scaleEffect(0.5)
                                        .offset(x: xOffset,
                                                y: yOffset)
                                        .frame(width: 50, height: 50)
                                        .padding()
                                        .gesture(DragGesture()
                                            .onChanged { value in
                                                dragOffsets[index] = value.translation
                                                checkCollision(index: index)
                                                if collisions[index] == true {
                                                    resetOffsets(index: index)
                                                    liquidsInBlender += 1
                                                    if liquidsInBlender == 5 {
                                                        moment = .solids
                                                    }
                                                }
                                            }
                                        )
                                        .disabled(collisions[index])
                                        .overlay(AbsoluteFrameReader(id: "\(index)"))
                                }
                                
                                
                            case .solids:
                                if ingredient.moment == "solid" {
                                    Image(collisions[index] ? "xicara" : ingredient.title)
                                        .scaleEffect(0.5)
                                        .offset(x: xOffset,
                                                y: yOffset)
                                        .frame(width: 50, height: 50)
                                        .padding()
                                        .gesture(DragGesture()
                                            .onChanged { value in
                                                dragOffsets[index] = value.translation
                                                checkCollision(index: index)
                                                if collisions[index] == true {
                                                    resetOffsets(index: index)
                                                    solidsInBlender += 1
                                                    if solidsInBlender == 3 {
                                                        moment = .powder
                                                    }
                                                }
                                            }
                                        )
                                        .disabled(collisions[index])
                                        .overlay(AbsoluteFrameReader(id: "\(index)"))
                                }
                                
                            case .powder:
                                if ingredient.moment == "powder" {
                                    Image(collisions[index] ? "colher" : ingredient.title)
                                        .scaleEffect(0.5)
                                        .offset(x: xOffset,
                                                y: yOffset)
                                        .frame(width: 50, height: 50)
                                        .padding()
                                        .gesture(DragGesture()
                                            .onChanged { value in
                                                dragOffsets[index] = value.translation
                                                checkCollision(index: index)
                                                if collisions[index] == true {
                                                    resetOffsets(index: index)
                                                    powderInBlender += 1
                                                }
                                            }
                                        )
                                        .disabled(collisions[index])
                                        .overlay(AbsoluteFrameReader(id: "\(index)"))
                                }
                            }
                        }
                    }
                    
                    ZStack(alignment: .trailing) {
                        Image("liquidMaquina")
                            .scaleEffect(0.5)
                        //                            .opacity(0.2)
                    }
                    .frame(width: 150, height: 320)
                    //                    .background(collisions.contains(true) ? .red: .blue)
                    .overlay(AbsoluteFrameReader(id: "blender"))
                    
                    VStack(alignment: .trailing) {
                        
                        if powderInBlender == 1 {
                            NavigationLink {
                                PourCakeView()
                            } label: {
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(Color("marrom"))
                                    .bold()
                                    .font(.title)
                                    .frame(width: 75, height: 75)
                                    .background(Color("begezinho"))
                            }
                            .frame(alignment: .bottom)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 5, y: 5)
                        }
                        
                    }
   
                }
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
    
    
    private func resetOffsets(index: Int) {
        dragOffsets[index].width = 0
        dragOffsets[index].height = 0
        collisions[index] = true
    }
    
    private func checkCollision(index: Int) {
        let ingredientFrame = frames[index].offsetBy(dx: dragOffsets[index].width, dy: dragOffsets[index].height)
        
        print("blender frame: \(blenderFrame)")
        print("ingredientFrame: \(ingredientFrame)")
        
        if ingredientFrame.intersects(blenderFrame) {
            collisions[index] = true
        } else {
            collisions[index] = false
        }
    }
    
}
