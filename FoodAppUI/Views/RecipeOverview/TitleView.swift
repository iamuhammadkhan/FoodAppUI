//
//  TitleView.swift
//  FoodAppUI
//
//  Created by Muhammad Khan on 8/23/21.
//

import SwiftUI

struct TitleView: View {
    
    @ObservedObject var manager: RecipeManager
    
    var body: some View {
        Text("Daily Cooking Quest")
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.gray)
        Text(manager.getCurrentRecipe().title)
            .font(.system(size: 24, weight: .bold))
            .foregroundColor(manager.currentRecipeIndex%2 == 0 ? .black : .white)
    }
}
