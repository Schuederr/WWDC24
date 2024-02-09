//
//  IngredientesModel.swift
//  WWDC24
//
//  Created by Natalia Schueda on 05/02/24.
//

import Foundation
import SwiftUI

struct Ingredient: Codable, Identifiable, Hashable {
    let title: String
    let image: String
    let id: UUID
    
    static func populateIngredients() -> [Ingredient] {
        var ingredients: [Ingredient] = []
        
        let farinha = Ingredient(title: "farinha", image: "nada ainda", id: UUID())
        ingredients.append(farinha)
        
        let ovos = Ingredient(title: "ovos", image: "nada ainda", id: UUID())
        ingredients.append(ovos)        
        
        let leite = Ingredient(title: "leite", image: "nada ainda", id: UUID())
        ingredients.append(leite)
        
        let fuba = Ingredient(title: "fuba", image: "nada ainda", id: UUID())
        ingredients.append(fuba)
        
        return ingredients
    }
}
