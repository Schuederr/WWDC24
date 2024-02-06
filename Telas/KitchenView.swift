//
//  KitchenView.swift
//  WWDC24
//
//  Created by Natalia Schueda on 05/02/24.
//

import SwiftUI

struct KitchenView: View {
    
    @State private var isShowingSheet = false
    
    var body: some View {
        VStack {
            Text("cozinha linda").padding()
            
            NavigationLink("Ir para tela do bolo", destination: CakeView()).padding()
            
            Button(action: {
                isShowingSheet.toggle()
            }, label: {
                Text("abre sheet")
            }).sheet(isPresented: $isShowingSheet, content: {
                
                Text("vaiiii")
                
                Button {
                    isShowingSheet.toggle()
                } label: {
                    Text("Fecha")
                        
                }
                
            }).padding()
        }
    }
}

#Preview {
    KitchenView()
}
