//
//  P5AnimatedStarView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 1/15/22.
//

import SwiftUI
import Shapes

struct P5AnimatedStarView: View {
  var primary: Color = .primary
  var secondary: Color = .secondary
  // TODO: Fix frame animation to preserve infinite star effect
  @State private var animating: Bool = false
  var body: some View {
    GeometryReader { proxy in
      ZStack {
        
        IsotoxalPolygon(sides: 10, innerRadius: 0.5)
          .foregroundColor(primary)

        // OLD 1 : 0.75
        IsotoxalPolygon(sides: 10, innerRadius: 0.5)
          .scaleEffect(animating ? 1.25 : 0.75)
          .foregroundColor(secondary)

        IsotoxalPolygon(sides: 10, innerRadius: 0.5)
          .scaleEffect(animating ? 1 : 0.5)
          .foregroundColor(primary)
        
        IsotoxalPolygon(sides: 10, innerRadius: 0.5)
          .scaleEffect(animating ? 0.75 : 0.25)
          .foregroundColor(secondary)

        IsotoxalPolygon(sides: 10, innerRadius: 0.5)
          .scaleEffect(animating ? 0.5 : 0)
          .foregroundColor(primary)

        IsotoxalPolygon(sides: 10, innerRadius: 0.5)
          .scaleEffect(animating ? 0.25 : 0)
          .foregroundColor(secondary)
      }
      .clipShape(IsotoxalPolygon(sides: 10, innerRadius: 0.5))
      .frame(width: proxy.size.width, height: proxy.size.height)
      .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false), value: animating)
      .drawingGroup()
    }
    .task {
      animating = true
    }
  }
}

struct P5AnimatedStars_Previews: PreviewProvider {
  static var previews: some View {
    P5AnimatedStarView(primary: .black, secondary: .red)
    .frame(width: 256, height: 512)
    .border(Color.purple)
  }
}
