//
//  ContentView.swift
//  FoodAppUI
//
//  Created by Muhammad Khan on 8/22/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var manager = RecipeManager()
    @Namespace private var viewSpace
    
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
            RecipeOverview(manager: manager, viewSpace: viewSpace)
                .padding(.horizontal)
                
            // lets do recipe detail next
            if manager.selectedRecipe != nil {
                RecipeDetailView(manager: manager, viewSpace: viewSpace)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
