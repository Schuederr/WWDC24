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
    
//    @State private var isAnimating: Bool = false
//    
    @State private var vovo = true
    
    var body: some View {
        
        ZStack {
            
            Image("cozinha")
                .resizable()
                .ignoresSafeArea()
            
            //buttons
            VStack {
                HStack {
                    Button(action: {
                        sheetFolhinha.toggle()
                    }, label: {
                        Image("folhinha").scaleEffect(0.5)
                    })
                    .frame(width: 120, height: 220)
                    .padding(.bottom, 100)
                    .padding(.trailing, 200)
                    .sheet(isPresented: $sheetFolhinha, content: {
                        Text("folhinha")
                        Button {
                            sheetFolhinha.toggle()
                        } label: {
                            Text("Fecha")
                        }
                    })
//                    .onAppear {
//                        withAnimation(.easeOut(duration: 0.5)) {
//                            isAnimating = true
//                            }
//                        }
//                    .scaleEffect(isAnimating ? 1.0 : 0.6)
                    
                    Button(action: {
                        sheetBarco.toggle()
                    }, label: {
                        Image("barco").scaleEffect(0.5)
                    })
                    .frame(width: 140, height: 225)
                    .padding(.leading, 150)
//                    .padding(.bottom, 100)
                    .sheet(isPresented: $sheetBarco, content: {
                        Text("barco")
                        Button {
                            sheetBarco.toggle()
                        } label: {
                            Text("Fecha")
                        }
                    })
                }
                
                HStack {
                    Button(action: {
                        sheetFuba.toggle()
                    }, label: {
                        Image("sacoFuba").scaleEffect(0.5)
                    })
                    .frame(width: 135, height: 165)
                    .padding(.bottom, 250)
                    .padding(.leading, 350)
                    .sheet(isPresented: $sheetFuba, content: {
                        Text("fuba")
                        Button {
                            sheetFuba.toggle()
                        } label: {
                            Text("Fecha")
                        }
                    })
                    
                    Button(action: {
                        sheetRetrato.toggle()
                    }, label: {
                        Image("retrato").scaleEffect(0.5)
                    })
                    .frame(width: 140, height: 50)
                    .padding(.leading, 370)
                    .padding(.bottom, 100)
                    .sheet(isPresented: $sheetRetrato, content: {
                        Text("retrato")
                        Button {
                            sheetRetrato.toggle()
                        } label: {
                            Text("Fecha")
                        }
                    })
                }
            }.frame(maxWidth: .infinity)
            
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
                }
            }
            .frame(width: 1100, height: 780, alignment: .bottomTrailing)
            .shadow(color: .black.opacity(0.25), radius: 2, x: 5, y: 5)
            
            if vovo == true {
                ZStack {
                    Rectangle()
                        .foregroundStyle(.opacity(0.5))
                        .ignoresSafeArea()
                    Image("vovo")
                        .resizable()
                        .scaledToFit()
                        .ignoresSafeArea()
                        .offset(CGSize(width: -300, height: 250))
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
