//
//  WaitingView.swift
//  wwdc24
//
//  Created by Natalia Schueda on 17/02/24.
//

import SwiftUI

struct WaitingView: View {
    var body: some View {
        
        ZStack {
            
            Image("cozinha")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
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
                }
            }
            .frame(width: 1100, height: 780, alignment: .bottomTrailing)
            .shadow(color: .black.opacity(0.25), radius: 2, x: 5, y: 5)
        }.background(Color("amarelinho"))
        
    }
}

#Preview {
    WaitingView()
}
