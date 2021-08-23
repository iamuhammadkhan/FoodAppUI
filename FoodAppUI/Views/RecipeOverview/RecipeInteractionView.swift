//
//  RecipeInteractionView.swift
//  FoodAppUI
//
//  Created by Muhammad Khan on 8/23/21.
//

import SwiftUI

struct RecipeInteractionView: View {
    
    let recipe: RecipeItem
    let index: Int
    let count: Int
    @ObservedObject var manager: RecipeManager
    public var viewSpace: Namespace.ID //lets add some matched geometry effect
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            manager.currentRecipeIndex%2 == 0 ? Color.lightBackground.opacity(0.1) : Color.darkBackground.opacity(0.1),
                            Color.green, Color.green
                        ]),
                        startPoint: .leading,
                        endPoint: .trailing),
                    lineWidth: 4
                )
                .scaleEffect(1.15)
                .matchedGeometryEffect(id: "borderId", in: viewSpace, isSource: true)
            
            ArrowShape(reachedTop: index == 0, reachedBottom: index == count - 1)
                .stroke(Color.gray,
                        style: StrokeStyle(lineWidth: 2.5, lineCap: .round, lineJoin: .round))
                .frame(width: UIScreen.screenWidth - 32, height: UIScreen.screenWidth - 32)
                .scaleEffect(1.15)
                .matchedGeometryEffect(id: "arrowId", in: viewSpace, isSource: true)
            
            Image(recipe.imageName)
                .resizable()
                .scaledToFit()
                .matchedGeometryEffect(id: "imageId", in: viewSpace, isSource: true)
            
            // this circle will be used to drag interaction
            Circle()
                .fill(Color.black.opacity(0.001))
                .scaleEffect(1.2)
                .gesture(
                    DragGesture(minimumDistance: 10)
                        .onChanged({ value in
                            withAnimation {
                                manager.chageSwipeValue(value: value.translation.height)
                            }
                        })
                        .onEnded({ value in
                            withAnimation {
                                manager.swipeEnded(value: value.translation.height)
                            }
                        })
                )
        }
    }
}
