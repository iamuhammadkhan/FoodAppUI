//
//  DescriptionView.swift
//  FoodAppUI
//
//  Created by Muhammad Khan on 8/23/21.
//

import SwiftUI

struct DescriptionView: View {
    
    @ObservedObject var manager: RecipeManager
    
    var body: some View {
        HStack(spacing: 12) {
            Text(manager.getCurrentRecipe().description)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(manager.currentRecipeIndex%2 == 0 ? .black : .white)
            
            Spacer()
            
            Button(action: {
                withAnimation {
                    manager.selectedRecipe = manager.getCurrentRecipe()
                }
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.green)
                        .frame(width: 50, height: 50)
                        .rotationEffect(.degrees(45))
                    
                    Image(systemName: "arrow.right")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                }
            })            
        }
    }
}
