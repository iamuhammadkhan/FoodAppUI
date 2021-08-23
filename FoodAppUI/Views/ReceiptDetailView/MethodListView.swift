//
//  MethodListView.swift
//  FoodAppUI
//
//  Created by Muhammad Khan on 8/23/21.
//

import SwiftUI

struct MethodListView: View {
    let methods: [String]
    var body: some View {
        ForEach(methods, id: \.self) { value in
            Text(value)
                .padding(.horizontal)
                .padding(.vertical, 4)
        }
    }
}
