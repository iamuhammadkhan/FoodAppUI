//
//  CircularToggleStyle.swift
//  FoodAppUI
//
//  Created by Muhammad Khan on 8/23/21.
//

import SwiftUI

struct CircularToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return
            HStack(alignment: .top) {
                ZStack {
                    Circle()
                        .stroke(configuration.isOn ? Color.green : Color.gray.opacity(0.5), lineWidth: 2)
                        .frame(width: 20, height: 20)
                    
                    if configuration.isOn {
                        Circle()
                            .fill(Color.green)
                            .frame(width: 10, height: 10)
                    }
                }
                .padding(.horizontal)
                
                configuration.label
            }.onTapGesture {
                withAnimation {
                    configuration.isOn.toggle()
                }
            }
    }
}
