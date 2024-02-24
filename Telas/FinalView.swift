//
//  FinalView.swift
//  WWDC24
//
//  Created by Natalia Schueda on 05/02/24.
//

import SwiftUI

struct FinalView: View {
    
    @State private var sheetReceita = false
    @State private var sheetCredits = true
    
    var body: some View {
        ZStack {
            Image("final")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            ZStack {
                Image("fala")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(0.6)
                    .ignoresSafeArea()
                
                Text("This cake is looking delicious! You're really a gifted cook.\n\nI'm so glad that you came in today and we spent some time together.")
                    .font(.custom("Arvo", size: 24))
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(Color("marrom"))
                    .frame(width: 600, height: 185, alignment: .topLeading)
                    .offset(x: 45, y: 15)
                    .rotationEffect(Angle(degrees: -2))
//                    .background()
            }.offset(x: 180, y: -275)
            
            Image("bolo")
                .scaleEffect(0.4)
                .offset(CGSize(width: 170, height: 150))
                .rotationEffect(Angle(degrees: 3))
                .shadow(color: .black.opacity(0.25), radius: 2, x: 5, y: 5)
            
            //buttons
            VStack(alignment: .trailing, spacing: 20) {
                Button(action: {
                    sheetReceita.toggle()
                }, label: {
                    Text("SEE FULL RECIPE")
                        .font(.custom("VastShadow-Regular", size: 24))
                        .foregroundStyle(Color("marrom")).multilineTextAlignment(.center)
                        .frame(width: 330, height: 75)
                        .background(Color("begezinho"))
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 5, y: 5)
                    
                }).sheet(isPresented: $sheetReceita, content: {
                    VStack {
                        Text("receita")
                        Button(action: {
                            sheetReceita.toggle()
                        }, label: {
                            Text("Fecha")
                        })
                    }
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: .infinity)
                    .ignoresSafeArea()
                    .background(Color("begezinho"))
                })
                
                Button(action: {
                    sheetCredits.toggle()
                }, label: {
                    Text("Credits")
                        .font(.custom("VastShadow-Regular", size: 16))
                        .foregroundStyle(Color("begezinho")).multilineTextAlignment(.center)
                    
                        .frame(width: 125, height: 30)
                        .background(Color("marrom"))
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 5, y: 5)
                }).sheet(isPresented: $sheetCredits, content: {
                    VStack {
                        Text("credits")
                        Button(action: {
                            sheetCredits.toggle()
                        }, label: {
                            Text("Fecha")
                        })
                    }.frame(maxWidth: .infinity)
                        .frame(maxHeight: .infinity)
                        .ignoresSafeArea()
                        .background(Color("begezinho"))

                })
                
                NavigationLink {
                    ContentView()
                } label: {
                    Text("Play again")
                        .font(.custom("VastShadow-Regular", size: 20))
                        .foregroundStyle(Color("marrom"))
                        .frame(width: 200, height: 40)
                        .background(Color("begezinho"))
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 5, y: 5)
                }
                
            }
            .frame(maxWidth: .infinity)
            .offset(CGSize(width: 420, height: -40))
            
        }.background(Color("amarelo"))
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
    }
}

#Preview {
    FinalView()
}
