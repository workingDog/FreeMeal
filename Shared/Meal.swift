//
//  Meal.swift
//  Meal
//
//  Created by Ringo Wathelet on 2021/07/16.
//

import Foundation


struct ApiResponse: Codable {
    var meals: [Meal]?
}


struct Meal: Codable, Identifiable {
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
    
    var strIngredient1: String?
    var strIngredient2: String?
    var strIngredient3: String?
    var strIngredient4: String?
    var strIngredient5: String?
    var strIngredient6: String?
    var strIngredient7: String?
    var strIngredient8: String?
    var strIngredient9: String?
    var strIngredient10: String?
    var strIngredient11: String?
    var strIngredient12: String?
    var strIngredient13: String?
    var strIngredient14: String?
    var strIngredient15: String?
    var strIngredient16: String?
    var strIngredient17: String?
    var strIngredient18: String?
    var strIngredient19: String?
    var strIngredient20: String?
    
    var strMeasure1: String?
    var strMeasure2: String?
    var strMeasure3: String?
    var strMeasure4: String?
    var strMeasure5: String?
    var strMeasure6: String?
    var strMeasure7: String?
    var strMeasure8: String?
    var strMeasure9: String?
    var strMeasure10: String?
    var strMeasure11: String?
    var strMeasure12: String?
    var strMeasure13: String?
    var strMeasure14: String?
    var strMeasure15: String?
    var strMeasure16: String?
    var strMeasure17: String?
    var strMeasure18: String?
    var strMeasure19: String?
    var strMeasure20: String?
    
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
        
        case strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5
        case strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10
        case strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15
        case strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20
        
        case strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5
        case strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10
        case strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15
        case strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
    }
    
    func getAllIngredients() -> [String] {
        var ingredients = [String]()
        
        ingredients.append(strIngredient1 ?? "")
        ingredients.append(strIngredient2 ?? "")
        ingredients.append(strIngredient3 ?? "")
        ingredients.append(strIngredient4 ?? "")
        ingredients.append(strIngredient5 ?? "")
        ingredients.append(strIngredient6 ?? "")
        ingredients.append(strIngredient7 ?? "")
        ingredients.append(strIngredient8 ?? "")
        ingredients.append(strIngredient9 ?? "")
        ingredients.append(strIngredient10 ?? "")
        ingredients.append(strIngredient11 ?? "")
        ingredients.append(strIngredient12 ?? "")
        ingredients.append(strIngredient13 ?? "")
        ingredients.append(strIngredient14 ?? "")
        ingredients.append(strIngredient15 ?? "")
        ingredients.append(strIngredient16 ?? "")
        ingredients.append(strIngredient17 ?? "")
        ingredients.append(strIngredient18 ?? "")
        ingredients.append(strIngredient19 ?? "")
        ingredients.append(strIngredient20 ?? "")

        return ingredients.filter{!$0.isEmpty}
    }
    
    func getAllMeasures() -> [String] {
        var measures = [String]()
        
        measures.append(strMeasure1 ?? "")
        measures.append(strMeasure2 ?? "")
        measures.append(strMeasure3 ?? "")
        measures.append(strMeasure4 ?? "")
        measures.append(strMeasure5 ?? "")
        measures.append(strMeasure6 ?? "")
        measures.append(strMeasure7 ?? "")
        measures.append(strMeasure8 ?? "")
        measures.append(strMeasure9 ?? "")
        measures.append(strMeasure10 ?? "")
        measures.append(strMeasure11 ?? "")
        measures.append(strMeasure12 ?? "")
        measures.append(strMeasure13 ?? "")
        measures.append(strMeasure14 ?? "")
        measures.append(strMeasure15 ?? "")
        measures.append(strMeasure16 ?? "")
        measures.append(strMeasure17 ?? "")
        measures.append(strMeasure18 ?? "")
        measures.append(strMeasure19 ?? "")
        measures.append(strMeasure20 ?? "")
        
        return measures
    }
    
    // key=ingredient, value=measure
    func getAllMaterials() -> [String : String] {
        var dictionary: [String: String] = [:]
        let measures = getAllMeasures()
        for (index, element) in getAllIngredients().enumerated() {
            if !element.isEmpty {
                dictionary[element] = measures[index]
            }
        }
        return dictionary
    }
    
}

