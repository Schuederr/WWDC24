//
//  IngredientesModel.swift
//  WWDC24
//
//  Created by Natalia Schueda on 05/02/24.
//

import Foundation
import SwiftUI
//import UniformTypeIdentifiers

struct Ingredients: Codable, Identifiable {
    let title: String
    let image: String
    let id: UUID
    
    static func populateIngredients() -> [Ingredients] {
        var ingredient: [Ingredients] = []
        
        let farinha = Ingredients(title: "farinha", image: "nada ainda", id: UUID())
        ingredient.append(farinha)
        
        return ingredient
    }
    
//    static var transferRepresentation: some TransferRepresentation { CodableRepresentation(contentType: .ingredients)
//    }
//}
//
////fazer o negocio na mao que o andre falou
//extension UTType {
//    static let ingredients = UTType(exportedAs: "natalia.WWDC24.ingredients")
}
    
struct MockData {
    
}
