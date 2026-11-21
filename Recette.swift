//
//  Recette.swift
//  RecettesAPI
//
//  Created by konate on 06/11/2026.
//

import Foundation


struct Recette: Codable{
    var idMeal /*id */: String
    var strMeal /*nom*/ : String
    var strMealThumb /*image */: String
    var strInstructions: String
}

struct RecetteReponse : Codable {
    var meals : [Recette] 
}


