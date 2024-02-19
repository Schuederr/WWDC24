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
    let id: UUID
    
    static func populateIngredients() -> [Ingredient] {
        
        var ingredients: [Ingredient] = []
        
        let farinha = Ingredient(title: "farinha", id: UUID())
        ingredients.append(farinha)
        
        let ovo = Ingredient(title: "ovo", id: UUID())
        ingredients.append(ovo)
        
        let leite = Ingredient(title: "leite", id: UUID())
        ingredients.append(leite)
        
        let fuba = Ingredient(title: "fuba", id: UUID())
        ingredients.append(fuba)
        
        let acucar = Ingredient(title: "acucar", id: UUID())
        ingredients.append(acucar)
        
        let fermento = Ingredient(title: "fermento", id: UUID())
        ingredients.append(fermento)
        
        let oleo = Ingredient(title: "oleo", id: UUID())
        ingredients.append(oleo)
        
        return ingredients
    }
}
