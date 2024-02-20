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
    let moment: String
    let xicara: Bool
    let id: UUID
    
    static func populateIngredients() -> [Ingredient] {
        
        var ingredients: [Ingredient] = []
        
        let farinha = Ingredient(title: "farinha", moment: "solid", xicara: true, id: UUID())
        ingredients.append(farinha)
        
        let leite = Ingredient(title: "leite", moment: "liquid", xicara: true, id: UUID())
        ingredients.append(leite)
        
        let fuba = Ingredient(title: "fuba", moment: "solid", xicara: true, id: UUID())
        ingredients.append(fuba)
        
        let acucar = Ingredient(title: "acucar", moment: "solid", xicara: true, id: UUID())
        ingredients.append(acucar)
        
        let oleo = Ingredient(title: "oleo", moment: "liquid", xicara: true, id: UUID())
        ingredients.append(oleo)
        
        let ovo = Ingredient(title: "ovo", moment: "liquid", xicara: false, id: UUID())
        ingredients.append(ovo)
        
        let fermento = Ingredient(title: "fermento", moment: "powder", xicara: false, id: UUID())
        ingredients.append(fermento)
        
        return ingredients
    }
}
