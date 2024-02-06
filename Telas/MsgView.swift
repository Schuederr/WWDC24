//
//  MsgView.swift
//  WWDC24
//
//  Created by Natalia Schueda on 05/02/24.
//

import SwiftUI

struct MsgView: View {
    @State private var isShowingSheet = false
    
    var body: some View {
        VStack {
            
            Text("Começo").padding()
            
            NavigationLink("Ir para tela da cozinha", destination: KitchenView()).padding()
            
        }
    }
}

#Preview {
    MsgView()
}
