//
//  Shapes+Extensions.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 11/30/21.
//

import SwiftUI
import Shapes

extension Polygon {
  func vertices(in rect: CGRect, offset: Angle = .zero) -> [CGPoint] {
    let r = min(rect.size.width, rect.size.height) / 2
    let origin = CGPoint(x: rect.midX, y: rect.midY)
    return Array(0 ..< sides).map {
      let theta = 2 * .pi * CGFloat($0) / CGFloat(sides) - offset.radians - .pi / 2  // pointing north!
      return CGPoint(x: origin.x + r * cos(theta), y: origin.y + r * sin(theta))
    }
  }
}
