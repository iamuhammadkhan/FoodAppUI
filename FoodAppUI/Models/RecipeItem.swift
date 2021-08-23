//
//  RecipeItem.swift
//  FoodAppUI
//
//  Created by Muhammad Khan on 8/22/21.
//

import Foundation

struct RecipeItem {
    let id = UUID()
    let title: String
    let description: String
    let imageName: String
    let summery: [String : String]
    var ingredients: [Ingredients]
    let instrusctions: [String]
}
