//
//  WaitingView.swift
//  wwdc24
//
//  Created by Natalia Schueda on 17/02/24.
//

import SwiftUI

struct WaitingView: View {
    
    @State var vovo = true
    @State var isAnimating: Bool = false
    
    var body: some View {
        
        ZStack {
            Image("cozinha")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Image("folhinha")
                        .scaleEffect(0.5)
                        .frame(width: 120, height: 220)
                        .offset(CGSize(width: -150, height: -150))
                    Image("barco")
                        .scaleEffect(0.5)
                        .frame(width: 140, height: 225)
                        .offset(CGSize(width: 250, height: -100))
                }
                HStack {
                    Image("sacoFuba")
                        .scaleEffect(0.5)
                        .frame(width: 135, height: 165)
                        .offset(CGSize(width: -20, height: -60))
                    Image("retrato")
                        .scaleEffect(0.5)
                        .frame(width: 140, height: 50)
                        .offset(CGSize(width: 350, height: -10))
                }
            }.frame(maxWidth: .infinity)
            
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
                            .task {
                                withAnimation(.bouncy(duration: 0.65).repeatForever()) {
                                    isAnimating = true
                                    }
                                }
                            .scaleEffect(isAnimating ? 1.0 : 0.98)
                        
                        ZStack {
                            Image("fala")
                                .resizable()
                                .scaledToFit()
                                .scaleEffect(0.7)
                                .ignoresSafeArea()
                            VStack {
                                Text("ta no forno pera ai")
                                    .foregroundStyle(Color("marrom"))
                                    .multilineTextAlignment(.leading)
                            }
                            .frame(width: 500, height: 200)
                            //                            .background()
                            .offset(CGSize(width: 25, height: 0))
                        }.offset(CGSize(width: 10.0, height: -250))
                    }
                }
            }
            
            VStack(alignment: .trailing) {
                NavigationLink {
                    FinalView()
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
            
        }.background(Color("amarelinho"))
        
    }
}

#Preview {
    WaitingView()
}
