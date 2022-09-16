//
//  P5AnimatedStarParty.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 1/15/22.
//

import SwiftUI

struct P5AnimatedStarParty: View {
  var primary: Color = .black
  var secondary: Color = .white
  var starCount: Int = 30
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        secondary.ignoresSafeArea()
        ForEach(0..<starCount, id:\.self) { _ in
          let frame: CGSize = CGSize(width: Double.random(in: dim / 10 ... dim), height: Double.random(in: 0 ... dim))
          let offset: CGSize = CGSize(width: Double.random(in: 0 ... dim), height: Double.random(in: 0 ... dim))
          P5AnimatedStarView(primary: primary, secondary: secondary)
            .frame(width: frame.width, height: frame.height)
            .rotationEffect(.degrees(Double.random(in: 0...180)))
            .offset(x: -dim/2 + offset.width, y: -dim/2 + offset.height)
          
        }
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct P5AnimatedStarParty_Previews: PreviewProvider {
  static var previews: some View {
    P5AnimatedStarParty(primary: .tlouSecondary, secondary: .tlouYellow)
  }
}
