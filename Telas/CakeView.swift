//
//  CakeView.swift
//  WWDC24
//
//  Created by Natalia Schueda on 05/02/24.
//

import SwiftUI

struct CakeView: View {
    
    @State var ingredients = Ingredients.populateIngredients()
    
    @State private var offset = CGSize.zero
    
    var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                offset = CGSize(width: value.startLocation.x + value.translation.width,
                                height: value.startLocation.y + value.translation.height)
            }
    }
    
    var body: some View {
        
        VStack {

            Text("fazer o bolo").padding()
            NavigationLink("Ir para tela final", destination: FinalView()).padding()
            
            ForEach($ingredients) { $ingredient in
                Text(ingredient.title)
                    .offset(offset)
                    .gesture(dragGesture)
                    .padding()
            }
            
            Button("Reset") {
                        offset = .zero
            }.padding()
        }
    }
    
    
//    #Preview {
//        CakeView()
//    }
}
