//
//  METalentIcon.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 2/2/23.
//

import SwiftUI
import Shapes

// Barrier Talent
struct METalentIcon: View {
  @State private var position: CGPoint = .zero
  
  var body: some View {
    VStack {
      Slider(value: $position.x, in: -0.5...0.5)
      Slider(value: $position.y, in: -0.5...0.5)
      
      GeometryReader { proxy in
        let dim: CGFloat = 256
        ZStack {
          AngularGradient(colors: [.red, .orange, .yellow, .green, .blue, .purple, .red], center: .center)
          
          let profile = Egg(apexAngle: 90)
            .rotation(.radians(.pi))
            .scale(0.5)
            .offset(x: 0, y: -dim * 0.15)
            .adding(
              UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: dim * 0.25, topTrailing: dim * 0.25))
                .scale(x: 0.8, y: 0.5)
                .offset(x: 0, y: dim * 0.3)
            )
            .offset(x: position.x * 256, y: position.y * 256)
          
          let hatching =
          Hatching(
            spacing: 25,
            angle: .degrees(90),
            gradientWidth: true,
            lineWidth: 10
          )
          .rotation(.degrees(-90))
          
          ZStack {
            Color.black.opacity(0.3)
            profile
              .foregroundColor(.white)
              .mask(
                hatching
              )
            
            hatching
              .invert()
              .subtracting(profile)
              .foregroundColor(.white)
          }
          .frame(width: 256, height: 256)
          
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
  }
}

struct METalentIcon_Previews: PreviewProvider {
  static var previews: some View {
    METalentIcon()
  }
}
