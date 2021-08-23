//
//  CGPoint+Extension.swift
//  FoodAppUI
//
//  Created by Muhammad Khan on 8/22/21.
//

import SwiftUI

extension CGPoint {
    static func pointOnCircle(center: CGPoint, radius: CGFloat, angle: CGFloat) -> CGPoint {
        let x = center.x + radius * cos(angle)
        let y = center.y + radius * sin(angle)
        return CGPoint(x: x, y: y)
    }
}
