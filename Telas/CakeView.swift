import SwiftUI

struct CakeView: View {
    
    // this view is pure genius - and stress
    
    @State var ingredients = Ingredient.populateIngredients()
    @State var moment = Moment.liquids
    
    @State var dragOffsets: [CGSize] = Array(repeating: .zero, count: 10)
    @State var frames: [CGRect] = Array(repeating: .zero, count: 10)
    @State var collisions: [Bool] = Array(repeating: false, count: 10)
    @State var blenderFrame = CGRect()
    
    @State var liquidsInBlender: Int = 0
    @State var solidsInBlender: Int = 0
    
    @State var blend = false
    @State var blenderFull = false
    @State var blenderWorking = false
    @State var blenderWorking2 = false
    @State var blenderDone = false
    
    @State var liquidSpeech = true
    @State var solidSpeech = false
    @State var powderSpeech = false
    @State var blenderSpeech = false
    @State var finalSpeech = false
    
    let gridItems = [GridItem(), GridItem(), GridItem()]
    
    var body: some View {
        ZStack {
            
            Image("tableCake")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            HStack {
                LazyVGrid(columns: gridItems, spacing: 10) {
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
                                    .padding(10)
                                    .gesture(DragGesture()
                                        .onChanged { value in
                                            dragOffsets[index] = value.translation
                                            checkCollision(index: index)
                                            if collisions[index] == true {
                                                resetOffsets(index: index)
                                                liquidsInBlender += 1
                                                if liquidsInBlender == 5 {
                                                    moment = .solids
                                                    solidSpeech = true
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
                                    .padding(10)
                                    .gesture(DragGesture()
                                        .onChanged { value in
                                            dragOffsets[index] = value.translation
                                            checkCollision(index: index)
                                            if collisions[index] == true {
                                                resetOffsets(index: index)
                                                liquidsInBlender += 1
                                                if liquidsInBlender == 5 {
                                                    moment = .solids
                                                    solidSpeech = true
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
                                    .padding(10)
                                    .gesture(DragGesture()
                                        .onChanged { value in
                                            dragOffsets[index] = value.translation
                                            checkCollision(index: index)
                                            if collisions[index] == true {
                                                resetOffsets(index: index)
                                                solidsInBlender += 1
                                                if solidsInBlender == 3 {
                                                    moment = .powder
                                                    powderSpeech = true
                                                }
                                            }
                                        }
                                    )
                                    .disabled(collisions[index])
                                    .overlay(AbsoluteFrameReader(id: "\(index)"))
                            }
                            
                            
                        case .powder:
                            if ingredient.moment == "powder" {
                                if blend == false {
                                    Image(collisions[index] ? "colher" : ingredient.title)
                                        .scaleEffect(0.7)
                                        .offset(x: xOffset,
                                                y: yOffset)
                                        .frame(width: 50, height: 50)
                                        .padding(10)
                                        .gesture(DragGesture()
                                            .onChanged { value in
                                                dragOffsets[index] = value.translation
                                                checkCollision(index: index)
                                                if collisions[index] == true {
                                                    resetOffsets(index: index)
                                                    blend = true
                                                    blenderFull = true
                                                    blenderSpeech = true
                                                }
                                            }
                                        )
                                        .disabled(collisions[index])
                                        .overlay(AbsoluteFrameReader(id: "\(index)"))
                                }
                            }
                        }
                    }
                }
                .offset(CGSize(width: -70, height: 70))
                .rotationEffect(Angle(degrees: -5))
                .frame(width: 350, height: 00)
                .padding(.trailing, 100)
                
                
                // blender conditions
                if blend == true {
                    ZStack {
                        if blenderFull {
                            Image("liquidCheioMaquina")
                                .scaleEffect(0.5)
                        } else if blenderWorking {
                            Image("liquidBatendo")
                                .scaleEffect(0.5)
                        } else if blenderWorking2 {
                            Image("liquidBatendoPronto")
                                .scaleEffect(0.5)
                        } else if blenderDone {
                            Image("liquidBatidoCheioMaquina")
                                .scaleEffect(0.5)
                        }
                    }
                    .frame(width: 150, height: 320)
                    .overlay(AbsoluteFrameReader(id: "blender"))
                    .onTapGesture {
                        blenderFull = false
                        blenderWorking = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            blenderWorking = false
                            blenderWorking2 = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                            blenderWorking2 = false
                            blenderDone = true
                        }
                    }
                    
                } else if moment == .solids {
                    ZStack(alignment: .trailing) {
                        Image("liquidMetadeMaquina")
                            .scaleEffect(0.5)
                    }
                    .frame(width: 150, height: 320)
                    .overlay(AbsoluteFrameReader(id: "blender"))
                    
                } else if moment == .powder {
                    ZStack(alignment: .trailing) {
                        Image("liquidCheioMaquina")
                            .scaleEffect(0.5)
                    }
                    .frame(width: 150, height: 320)
                    .overlay(AbsoluteFrameReader(id: "blender"))
                    
                } else {
                    ZStack(alignment: .trailing) {
                        Image("liquidMaquina")
                            .scaleEffect(0.5)
                    }
                    .frame(width: 150, height: 320)
                    .overlay(AbsoluteFrameReader(id: "blender"))
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
            
            
            // Speech conditions
            ZStack {
                if liquidSpeech == true || solidSpeech == true || powderSpeech == true || blenderSpeech == true {
                    Rectangle()
                        .foregroundStyle(.black.opacity(0.4))
                        .ignoresSafeArea()
                    
                    ZStack {
                        Image("fala")
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(0.7)
                            .ignoresSafeArea()
                        
                        if liquidSpeech {
                            Text("bota os liquido.")
                                .font(.custom("Arvo", size: 23))
                                .multilineTextAlignment(.leading)
                                .foregroundStyle(Color("marrom"))
                                .frame(width: 650, height: 250, alignment: .topLeading)
                                .offset(CGSize(width: 40, height: 8))
                                .rotationEffect(Angle(degrees: -2))
                            //                                                                                .background()
                        }
                        if solidSpeech {
                            Text("bota os solido.")
                                .font(.custom("Arvo", size: 23))
                                .multilineTextAlignment(.leading)
                                .foregroundStyle(Color("marrom"))
                                .frame(width: 650, height: 250, alignment: .topLeading)
                                .offset(CGSize(width: 40, height: 8))
                                .rotationEffect(Angle(degrees: -2))
                            //                                                                                .background()
                        }
                        if powderSpeech {
                            Text("bota o fermento.")
                                .font(.custom("Arvo", size: 23))
                                .multilineTextAlignment(.leading)
                                .foregroundStyle(Color("marrom"))
                                .frame(width: 650, height: 250, alignment: .topLeading)
                                .offset(CGSize(width: 40, height: 8))
                                .rotationEffect(Angle(degrees: -2))
                            //                                                                                .background()
                        }
                        if blenderSpeech {
                            Text("liga o liquidificador.")
                                .font(.custom("Arvo", size: 23))
                                .multilineTextAlignment(.leading)
                                .foregroundStyle(Color("marrom"))
                                .frame(width: 650, height: 250, alignment: .topLeading)
                                .offset(CGSize(width: 40, height: 8))
                                .rotationEffect(Angle(degrees: -2))
                            //                                                                                .background()
                        }
                        
                    }
                    .offset(CGSize(width: -150, height: -240))
                    
                    Text("Tap the screen")
                        .frame(width: 200, height: 50)
                        .font(.custom("Arvo", size: 20))
                        .foregroundStyle(Color("marrom"))
                        .background(Color("amarelinho"))
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 5, y: 5)
                        .offset(CGSize(width: 100, height: 120))
                        .opacity(0.8)
                    
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onTapGesture {
                liquidSpeech = false
                solidSpeech = false
                powderSpeech = false
                blenderSpeech = false
            }
            
            // NavigationLink
            VStack(alignment: .trailing) {
                if blenderDone == true {
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
                        .padding(50)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 5, y: 5)
                        .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                        .offset(CGSize(width: 0, height: 320))
                    
                }
            }
            
        }.background(Color("amarelinho"))
    }
    
    
    // functions and enum
    private func resetOffsets(index: Int) {
        dragOffsets[index].width = 0
        dragOffsets[index].height = 0
        collisions[index] = true
    }
    
    private func checkCollision(index: Int) {
        let ingredientFrame = frames[index].offsetBy(dx: dragOffsets[index].width, dy: dragOffsets[index].height)
        if ingredientFrame.intersects(blenderFrame) {
            collisions[index] = true
        } else {
            collisions[index] = false
        }
    }
    
    enum Moment {
        case liquids
        case solids
        case powder
    }
    
}
