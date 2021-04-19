//
//  Recipe.swift
//  Cookcademy
//
//  Created by Ben Stone on 4/19/21.
//

import Foundation

struct Recipe: Identifiable {
    var id = UUID()
    
    var mainInformation: MainInformation
    var ingredients: [Ingredient]
    var directions: [Direction]
    
    var isValid: Bool {
        mainInformation.isValid && !ingredients.isEmpty && !directions.isEmpty
    }
}

struct MainInformation {
    var name: String
    var description: String
    var author: String
    var category: Category
    
    enum Category: String, CaseIterable {
        case breakfast = "Breakfast"
        case lunch = "Lunch"
        case dinner = "Dinner"
        case dessert = "Dessert"
    }
    
    var isValid: Bool {
        !name.isEmpty && !description.isEmpty && !author.isEmpty
    }
}

struct Direction {
    var description: String
    var isOptional: Bool
}

struct Ingredient {
    var name: String
    var quantity: Double
    var unit: Unit
    
    init(name: String, quantity: Double, unit: Unit) {
        self.name = name
        self.quantity = quantity
        self.unit = unit
    }
    
    init() {
        self.init(name: "", quantity: 1.0, unit: .none)
    }
    
    var description: String {
        let formattedQuanity = String(format: "%g", quantity)
        switch unit {
        case .none:
            let formattedName = quantity == 1 ? name : "\(name)s"
            return "\(formattedQuanity) \(formattedName)"
        default:
            if quantity == 1 {
                return "1 \(unit.singularName) \(name)"
            } else {
                return "\(formattedQuanity) \(unit.rawValue) \(name) "
            }
        }
    }
    
    enum Unit: String, CaseIterable {
        case oz = "Ounces"
        case g = "Grams"
        case cups = "Cups"
        case tbs = "Tablespoons"
        case tsp = "Teaspoons"
        case none = "No units"
        
        var singularName: String { String(rawValue.dropLast()) }
    }
}


extension Recipe {
    static let emptyRecipe = Recipe(mainInformation: MainInformation(name: "",
                                                                     description: "",
                                                                     author: "",
                                                                     category: .breakfast),
                                    ingredients: [],
                                    directions: [])
    static let testRecipes: [Recipe] = [
        Recipe(mainInformation: MainInformation(name: "R0", description: "A description", author: "me", category: .breakfast), ingredients: [Ingredient(name: "I1", quantity: 1.0, unit: .none)], directions: [
            Direction(description: "D1", isOptional: false),
            Direction(description: "D2", isOptional: false)
           ]),
        Recipe(mainInformation: MainInformation(name: "R1", description: "A description", author: "me", category: .breakfast),
               ingredients: [Ingredient(name: "I1", quantity: 1.0, unit: .none)],
               directions: [
                Direction(description: "D1", isOptional: false),
                Direction(description: "D2", isOptional: false)
               ]
        )
    ]
}
