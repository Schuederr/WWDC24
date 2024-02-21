//
//  KitchenView.swift
//  WWDC24
//
//  Created by Natalia Schueda on 05/02/24.
//

import SwiftUI

struct KitchenView: View {
    
    @State private var sheetFolhinha = false
    @State private var sheetBarco = false
    @State private var sheetFuba = false
    @State private var sheetRetrato = false
    
    @State private var isAnimating: Bool = false
//    
    @State private var vovo = true
    
    @State private var abriuFolhinha = false
    @State private var abriuBarco = false
    @State private var abriuFuba = false
    @State private var abriuRetrato = false
    
    var body: some View {
        
        ZStack {
            
            Image("cozinha")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            //buttons
            VStack {
                
                HStack {
                    
                    //folhinha
                    Button(action: {
                        sheetFolhinha.toggle()
                    }, label: {
                        Image("folhinha")
                            .scaleEffect(0.5)
                            .blur(radius: abriuFolhinha ? 3.0 : 0.0)
                    })
                    .frame(width: 120, height: 220)
                    .offset(CGSize(width: -150, height: -150))
                    .sheet(isPresented: $sheetFolhinha, content: {
                        
                        Text("folhinha")
                        Button {
                            sheetFolhinha.toggle()
                            abriuFolhinha = true
                        } label: {
                            Text("Fecha")
                        }
                    })
                    .task {
                        withAnimation(.bouncy(duration: 0.65).repeatForever()) {
                            isAnimating = true
                            }
                        }
                    .scaleEffect(isAnimating ? 1.0 : 0.98)
                    
                    //barco
                    Button(action: {
                        sheetBarco.toggle()
                    }, label: {
                        Image("barco")
                            .scaleEffect(0.5)
                            .blur(radius: abriuBarco ? 3.0 : 0.0)
                    })
                    .frame(width: 140, height: 225)
                    .offset(CGSize(width: 250, height: -100))
                    .sheet(isPresented: $sheetBarco, content: {
                        
                        Text("barco")
                        Button {
                            sheetBarco.toggle()
                            abriuBarco = true
                        } label: {
                            Text("Fecha")
                        }
                    })
                    .task {
                        withAnimation(.bouncy(duration: 0.7).repeatForever()) {
                            isAnimating = true
                            }
                        }
                    .scaleEffect(isAnimating ? 1.0 : 0.98)
                }
                
                HStack {
                    
                    //fuba
                    Button(action: {
                        sheetFuba.toggle()
                    }, label: {
                        Image("sacoFuba")
                            .scaleEffect(0.5)
                            .blur(radius: abriuFuba ? 3.0 : 0.0)
                    })
                    .frame(width: 135, height: 165)
                    .offset(CGSize(width: -20, height: -60))
                    .sheet(isPresented: $sheetFuba, content: {
                        
                        Text("fuba")
                        Button {
                            sheetFuba.toggle()
                            abriuFuba = true
                        } label: {
                            Text("Fecha")
                        }
                    })
                    .task {
                        withAnimation(.bouncy(duration: 0.6).repeatForever()) {
                            isAnimating = true
                            }
                        }
                    .scaleEffect(isAnimating ? 1.0 : 0.98)
                    
                    //retrato
                    Button(action: {
                        sheetRetrato.toggle()
                    }, label: {
                        Image("retrato")
                            .scaleEffect(0.5)
                            .blur(radius: abriuRetrato ? 3.0 : 0.0)
                    })
                    .frame(width: 140, height: 50)
                    .offset(CGSize(width: 400, height: -10))
                    .sheet(isPresented: $sheetRetrato, content: {
                        
                        Text("retrato")
                        Button {
                            sheetRetrato.toggle()
                            abriuRetrato = true
                        } label: {
                            Text("Fecha")
                        }
                    })
                    .task {
                        withAnimation(.bouncy(duration: 0.75).repeatForever()) {
                            isAnimating = true
                            }
                        }
                    .scaleEffect(isAnimating ? 1.0 : 0.98)
                }
            }.frame(maxWidth: .infinity)
            
            if (abriuFolhinha == true) && (abriuBarco == true) && (abriuFuba == true) && (abriuRetrato == true) {
                
                VStack(alignment: .trailing) {
                    NavigationLink {
                        CakeView()
                    } label: {
                        Image(systemName: "chevron.right")
                            .foregroundStyle(Color("marrom"))
                            .bold()
                            .font(.title)
                            .frame(width: 75, height: 75)
                            .background(Color("begezinho"))
                    }.frame(alignment: .bottom)
                    
                }
                .padding(50)
                .shadow(color: .black.opacity(0.25), radius: 2, x: 5, y: 5)
                .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                .frame(maxHeight: .infinity)
                .offset(CGSize(width: 0, height: 300))
            }
            
            
            if vovo == true {
                ZStack {
                    Rectangle()
                        .foregroundStyle(.white.opacity(0.25))
                        .ignoresSafeArea()
                    
                    HStack {
                        Image("vovo")
                            .resizable()
                            .scaledToFit()
                            .ignoresSafeArea()
                            .offset(CGSize(width: 170, height: 110))
                        
                        ZStack {
                            Image("fala")
                                .resizable()
                                .scaledToFit()
                                .scaleEffect(0.7)
                                .ignoresSafeArea()
                            VStack {
                                Text("blablablabla nao defini ainda mas toca na tela pra pode mexe na cozinha")
                                    .multilineTextAlignment(.leading)
                                    .foregroundStyle(Color("marrom"))
                            }
                            .frame(width: 500, height: 200)
//                            .background()
                            .offset(CGSize(width: 25, height: 0))
                        }.offset(CGSize(width: 10.0, height: -250))
                    }
                }.onTapGesture {
                    vovo = false
                }
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("amarelinho"))
    }
}

#Preview {
    KitchenView()
}
