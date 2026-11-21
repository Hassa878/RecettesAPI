//
//  RecetteFavorite.swift
//  RecettesAPI
//
//  Created by konate on 09/11/2026.
//

import Foundation
import SwiftData

@Model

class RecetteFavorite{
    var idMeal /*id */: String
    var strMeal /*nom*/ : String
    var strMealThumb /*image */: String
    var strInstructions: String
    init(idMeal: String, strMeal: String, strMealThumb: String, strInstructions: String) {
        self.idMeal = idMeal
        self.strMeal = strMeal
        self.strMealThumb = strMealThumb
        self.strInstructions = strInstructions
    }
}

