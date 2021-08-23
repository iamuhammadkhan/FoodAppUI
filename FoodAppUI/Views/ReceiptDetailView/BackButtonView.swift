//
//  BackButtonView.swift
//  FoodAppUI
//
//  Created by Muhammad Khan on 8/23/21.
//

import SwiftUI

struct BackButtonView: View {
    
    @ObservedObject var manager: RecipeManager
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    manager.selectedRecipe = nil
                }
            }, label: {
                HStack {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20, weight: .bold))
                        .padding(24)
                    
                    Spacer()
                }
            })
            
            Spacer()
        }
    }
}

