//
//  SummeryView.swift
//  FoodAppUI
//
//  Created by Muhammad Khan on 8/23/21.
//

import SwiftUI

struct SummeryView: View {
    
    let recipe: RecipeItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            ForEach(recipe.summery.sorted(by: <), id: \.key) { key, value in
                HStack(spacing: 12) {
                    Image(systemName: Data.summeryImageName[key] ?? "")
                        .foregroundColor(.green)
                    Text(value)
                }
            }
            
            HStack(spacing: 12) {
                Image(systemName: "chart.bar.doc.horizontal")
                    .foregroundColor(.green)
                Text("Healthy")
            }
        }
        .font(.system(size: 17, weight: .semibold))
    }
}
