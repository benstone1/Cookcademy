//
//  ModifyRecipeView.swift
//  Cookcademy
//
//  Created by Ben Stone on 4/19/21.
//

import SwiftUI

struct ModifyRecipeView: View {
    @Binding var recipe: Recipe
    
    var body: some View {
        VStack {
            Text("Add a new recipe!")
                .padding()
            Button("Fill in the recipe with test data.") {
                // TODO: Add implementation for creating a recipe
                recipe.mainInformation = Recipe.testRecipes[0].mainInformation
                recipe.mainInformation.name += " Copy"
                recipe.directions = Recipe.testRecipes[0].directions
                recipe.ingredients = Recipe.testRecipes[0].ingredients
            }
            Spacer()
        }
    }
}

struct ModifyRecipeView_Previews: PreviewProvider {
    @State static var recipe = Recipe.emptyRecipe
    static var previews: some View {
        ModifyRecipeView(recipe: $recipe)
    }
}
