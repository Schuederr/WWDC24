//
//  File.swift
//  
//
//  Created by Natalia Schueda on 21/02/24.
//

import Foundation
import SwiftUI

struct CakeSpeech: Identifiable {
    let id: UUID
    let moment: String
    let text: String
    
    static func populateCakeSpeech() -> [CakeSpeech] {
        
        var speeches: [CakeSpeech] = []
        
        let liquidsSpeech = CakeSpeech(id: UUID(), moment: "liquid", text: "fala dos liquidos")
        speeches.append(liquidsSpeech)
        
        return speeches
    }
}
