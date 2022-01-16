//
//  P5AnimatedStars.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 1/15/22.
//

import SwiftUI
import Shapes

struct P5AnimeStars: View {
  var primary: Color = .primary
  var secondary: Color = .secondary
  // TODO: Fix frame animation to preserve infinite star effect
  @State private var animating: Bool = false
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        
        IsotoxalPolygon(sides: 10, innerRadius: 0.5)
          .foregroundColor(primary)
          .overlay(
            IsotoxalPolygon(sides: 10, innerRadius: 0.5)
              .stroke(primary, lineWidth: 10)
          )
        // OLD 1 : 0.75
        IsotoxalPolygon(sides: 10, innerRadius: 0.5)
          .frame(width: animating ? dim * 1.25 : dim * 0.75)
          .foregroundColor(secondary)
        
        IsotoxalPolygon(sides: 10, innerRadius: 0.5)
//          .frame(width: animating ? dim * 0.75 : dim * 0.5)
          .frame(width: animating ? dim * 1 : dim * 0.5)
          .foregroundColor(primary)
        
        IsotoxalPolygon(sides: 10, innerRadius: 0.5)
//          .frame(width: animating ? dim * 0.5 : dim * 0.25)
          .frame(width: animating ? dim * 0.75 : dim * 0.25)
          .foregroundColor(secondary)
        
        IsotoxalPolygon(sides: 10, innerRadius: 0.5)
//          .frame(width: animating ? dim * 0.25 : dim * 0)
          .frame(width: animating ? dim * 0.5 : dim * 0)
          .foregroundColor(primary)
        
        IsotoxalPolygon(sides: 10, innerRadius: 0.5)
//          .frame(width: animating ? dim * 0.25 : dim * 0)
          .frame(width: animating ? dim * 0.25 : dim * 0)
          .foregroundColor(secondary)
       
//        .mask(IsotoxalPolygon(sides: 10, innerRadius: 0.5))
        
      }
      .mask(IsotoxalPolygon(sides: 10, innerRadius: 0.5))
      .frame(width: proxy.size.width, height: proxy.size.height)
      .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false), value: animating)
    }
    .onAppear {
      animating.toggle()
    }
  }
}

struct P5AnimatedStars_Previews: PreviewProvider {
  static var previews: some View {
    P5AnimeStars(primary: .black, secondary: .red)
    .frame(width: 256, height: 256)
    .border(Color.purple)
  }
}
