//
//  MsgView.swift
//  WWDC24
//
//  Created by Natalia Schueda on 05/02/24.
//

import SwiftUI

struct MsgView: View {
    @State private var isShowingSheet = false
    
    /// fazer sombra e animação da aparição das imagens
    
    var body: some View {
        ZStack {
            
            Image("backMsg")
                .resizable()
                .aspectRatio(contentMode: .fit)
//                .scaleEffect(0.5)
            
            ZStack {
                Image("cerola")
                    .scaleEffect(0.55)
                VStack {
                    Image("msg1")
                        .scaleEffect(0.5)
                        .position(CGPoint(x: 160, y: 65))
                    Image("msg2")
                        .scaleEffect(0.5)
                        .position(CGPoint(x: 80, y: 0))
                    Image("msg3")
                        .scaleEffect(0.5)
                        .position(CGPoint(x: 125, y: -70))
                    Image("msg4")
                        .scaleEffect(0.5)
                        .position(CGPoint(x: 160, y: -140))
                }
                .frame(width: 300, height: 500)
            }
            
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
                }
            }
            .frame(width: 1100, height: 750, alignment: .bottomTrailing)
            .shadow(color: .black.opacity(0.25), radius: 2, x: 5, y: 5)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
        .background(Color("amarelo"))
    }
}

#Preview {
    MsgView()
}
