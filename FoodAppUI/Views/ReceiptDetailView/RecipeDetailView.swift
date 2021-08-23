//
//  RecipeDetailView.swift
//  FoodAppUI
//
//  Created by Muhammad Khan on 8/23/21.
//

import SwiftUI

struct RecipeDetailView: View {
    
    @ObservedObject var manager: RecipeManager
    @State var isIngredient = true
    public var viewSpace: Namespace.ID
    
    var body: some View {
        ZStack {
            if manager.currentRecipeIndex % 2 == 0 {
                Color.lightBackground
                    .ignoresSafeArea()
                    .transition(.move(edge: .bottom))
            } else {
                Color.darkBackground
                    .ignoresSafeArea()
                    .transition(.move(edge: .bottom))
            }
                
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .leading) {
                    // recipe image view
                    RecipeInteractionView(recipe: manager.selectedRecipe ?? manager.data[0], index: manager.currentRecipeIndex, count: manager.data.count, manager: manager, viewSpace: viewSpace)
                        .rotationEffect(.degrees(90))
                        .offset(y : -80)
                    Group {
                        // title
                        Text(manager.selectedRecipe?.title ?? "?")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(manager.currentRecipeIndex%2 == 0 ? .black : .white)
                        // info view
                        HStack(spacing: 32) {
                            HStack(spacing: 12) {
                                Image(systemName: Data.summeryImageName["time"] ?? "?")
                                    .foregroundColor(.green)
                                Text(manager.selectedRecipe?.summery["time"] ?? "?")
                            }
                                
                            HStack(spacing: 12) {
                                Image(systemName: Data.summeryImageName["ingredientCount"] ?? "?")
                                    .foregroundColor(.green)
                                Text(manager.selectedRecipe?.summery["ingredientCount"] ?? "?")
                            }
                        }
                        .foregroundColor(manager.currentRecipeIndex%2 == 0 ? .black : .white)
                        .padding(.vertical)
                    }
                    .padding(.horizontal)
                        
                    // ingredient/step toggle view
                    Toggle(isOn: $isIngredient, label: {})
                        .toggleStyle(IngredientMethodToggleStyle())
                        .foregroundColor(manager.currentRecipeIndex%2 == 0 ? .black : .white)
                        
                    if isIngredient {
                        // ingredient list
                        IngredientListView(manager: manager)
                    } else {
                        // steps list
                        MethodListView(methods: manager.selectedRecipe?.instrusctions ?? ["?"])
                            .foregroundColor(manager.currentRecipeIndex%2 == 0 ? .black : .white)
                    }
                }
            }
               
            BackButtonView(manager: manager)
                .foregroundColor(manager.currentRecipeIndex%2 == 0 ? .black : .white)
        }
    }
}
