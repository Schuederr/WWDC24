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
    let moment: Int
    let xicara: Bool
    let id: UUID
    
    static func populateIngredients() -> [Ingredient] {
        
        var ingredients: [Ingredient] = []
        
        let farinha = Ingredient(title: "farinha", moment: 2, xicara: true, id: UUID())
        ingredients.append(farinha)
        
        let leite = Ingredient(title: "leite", moment: 1, xicara: true, id: UUID())
        ingredients.append(leite)
        
        let fuba = Ingredient(title: "fuba", moment: 2, xicara: true, id: UUID())
        ingredients.append(fuba)
        
        let acucar = Ingredient(title: "acucar", moment: 2, xicara: true, id: UUID())
        ingredients.append(acucar)
        
        let oleo = Ingredient(title: "oleo", moment: 1, xicara: true, id: UUID())
        ingredients.append(oleo)
        
        let ovo = Ingredient(title: "ovo", moment: 1, xicara: false, id: UUID())
        ingredients.append(ovo)
        
        let fermento = Ingredient(title: "fermento", moment: 3, xicara: false, id: UUID())
        ingredients.append(fermento)
        
        return ingredients
    }
}
