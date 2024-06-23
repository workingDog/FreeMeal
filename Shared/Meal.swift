//
//  Meal.swift
//  Meal
//
//  Created by Ringo Wathelet on 2021/07/16.
//

import Foundation



struct ApiResponse: Decodable {
    var meals: [Meal]?
}

struct Ingredient: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var measure: String
}

struct Meal: Decodable, Identifiable {
    var id: String
    
    var name: String?
    var drinkAlternate: String?
    var category: String?
    var area: String?
    var instructions: String?
    var mealThumb: String?
    var tags: String?
    var youtube: String?
    var source: String?
    var imageSource: String?
    var creativeCommonsConfirmed: String?
    var dateModified: String?
    
    var ingredients: [Ingredient]
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decode(String.self, forKey: .id)
        self.name = try values.decodeIfPresent(String.self, forKey: .name)
        self.drinkAlternate = try values.decodeIfPresent(String.self, forKey: .drinkAlternate)
        self.category = try values.decodeIfPresent(String.self, forKey: .category)
        self.area = try values.decodeIfPresent(String.self, forKey: .area)
        self.instructions = try values.decodeIfPresent(String.self, forKey: .instructions)
        self.mealThumb = try values.decodeIfPresent(String.self, forKey: .mealThumb)
        self.tags = try values.decodeIfPresent(String.self, forKey: .tags)
        self.youtube = try values.decodeIfPresent(String.self, forKey: .youtube)
        self.source = try values.decodeIfPresent(String.self, forKey: .source)
        self.imageSource = try values.decodeIfPresent(String.self, forKey: .imageSource)
        self.creativeCommonsConfirmed = try values.decodeIfPresent(String.self, forKey: .creativeCommonsConfirmed)
        self.dateModified = try values.decodeIfPresent(String.self, forKey: .dateModified)
        
        // from: https://stackoverflow.com/questions/64265867/how-to-parse-json-using-custom-decoder-init-with-incrementing-keys-in-swift
        self.ingredients = []
        let container = try decoder.singleValueContainer()
        let ingredDict = try container.decode([String: String?].self)
        var index = 1
        while
            let ingredient = ingredDict["strIngredient\(index)"] as? String,
            let measure = ingredDict["strMeasure\(index)"] as? String,
            !measure.isEmpty
        {
            self.ingredients.append(Ingredient(name: ingredient, measure: measure))
            index += 1
        }
    }
        
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case drinkAlternate = "strDrinkAlternate"
        case category = "strCategory"
        case area = "strArea"
        case instructions = "strInstructions"
        case mealThumb = "strMealThumb"
        case tags = "strTags"
        case youtube = "strYoutube"
        case source = "strSource"
        case imageSource = "strImageSource"
        case creativeCommonsConfirmed = "strCreativeCommonsConfirmed"
        case dateModified
    }
  
}
