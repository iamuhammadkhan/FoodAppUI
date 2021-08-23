//
//  RecipeOverview.swift
//  FoodAppUI
//
//  Created by Muhammad Khan on 8/23/21.
//

import SwiftUI

struct RecipeOverview: View {
    
    @ObservedObject var manager: RecipeManager
    public var viewSpace: Namespace.ID
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Spacer()
            // title view
            TitleView(manager: manager)
            ZStack {
                // interaction view with image
                RecipeInteractionView(recipe: manager.getCurrentRecipe(), index: manager.currentRecipeIndex, count: manager.data.count, manager: manager, viewSpace: viewSpace)
                    .rotationEffect(.degrees(Double(-manager.swipeHeight)))
                    .offset(x: UIScreen.screenWidth / 2)
                HStack {
                    // summery view
                    SummeryView(recipe: manager.getCurrentRecipe())
                        .foregroundColor(manager.currentRecipeIndex%2 == 0 ? .black : .white)
                    Spacer()
                }
            }
            // descreiption view
            DescriptionView(manager: manager)

            Spacer()
        }
    }
}
