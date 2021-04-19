//
//  RecipeData.swift
//  Cookcademy
//
//  Created by Ben Stone on 4/19/21.
//

import Foundation

class RecipeData: ObservableObject {
    @Published var recipes = Recipe.testRecipes
}
