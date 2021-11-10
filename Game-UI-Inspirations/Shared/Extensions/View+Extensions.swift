//
//  ViewModifier+Extensions.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 11/9/21.
//

import SwiftUI

struct AngularOffset: ViewModifier {
  var magnitude: CGFloat
  var angle: Angle
  
  func body(content: Content) -> some View {
    let x = magnitude * cos(angle.radians)
    let y = magnitude * sin(angle.radians)
    content
      .offset(x: x, y: y)
  }
}

extension View {
  func angularOffset(magnitude: CGFloat, angle: Angle) -> some View {
    modifier(AngularOffset(magnitude: magnitude, angle: angle))
  }
}
