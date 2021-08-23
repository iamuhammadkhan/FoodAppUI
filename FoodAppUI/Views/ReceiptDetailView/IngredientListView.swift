//
//  IngredientListView.swift
//  FoodAppUI
//
//  Created by Muhammad Khan on 8/23/21.
//

import SwiftUI

struct IngredientListView: View {
    
    @ObservedObject var manager: RecipeManager
    
    var body: some View {
        ForEach(0..<manager.getCurrentRecipe().instrusctions.count) { i in
            Toggle(isOn: Binding<Bool>(
                get: { manager.data[manager.currentRecipeIndex].ingredients[i].available },
                set: { manager.data[manager.currentRecipeIndex].ingredients[i].available = $0 }
            ),
                   label: {
                    Text(manager.getCurrentRecipe().ingredients[i].title)
                        .foregroundColor(manager.currentRecipeIndex%2 == 0 ? .black : .white)
            })
            .toggleStyle(CircularToggleStyle())
            .padding(.vertical, 8)
        }
    }
}
