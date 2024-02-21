//
//  MsgView.swift
//  WWDC24
//
//  Created by Natalia Schueda on 05/02/24.
//

import SwiftUI

struct MsgView: View {
    @State private var isShowingSheet = false
    
    @State private var mensagem = Mensagem.hi
    
    /// fazer animação da aparição das imagens
    
    var body: some View {
        ZStack {
            Image("backMsg")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            ZStack {
                Image("celular")
                    .scaleEffect(0.55)
                Image("msg1")
                    .scaleEffect(0.5)
                    .offset(CGSize(width: 0, height: -175))
                if mensagem != .hi {
                    Image("msg2")
                        .scaleEffect(0.5)
                        .offset(CGSize(width: -60, height: -118))
                }
                if mensagem != .hi && mensagem != .hi2 {
                    Image("msg3")
                        .scaleEffect(0.5)
                        .offset(CGSize(width: -25, height: -65))
                }
                if mensagem == .seeYa {
                    Image("msg4")
                        .scaleEffect(0.5)
                        .offset(CGSize(width: 00, height: -7))
                }
            
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    mensagem = Mensagem.hi2
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
                    mensagem = Mensagem.bolo
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                    mensagem = Mensagem.seeYa
                }
            }
            
            if mensagem == Mensagem.seeYa {
                VStack(alignment: .trailing) {
                    NavigationLink {
                        KitchenView()
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
                .offset(CGSize(width: 0, height: 325))
            }
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
        .background(Color("amarelo"))
        
    }

    enum Mensagem {
        case hi
        case hi2
        case bolo
        case seeYa
    }
}

