//
//  GIItemRarityBackground.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 10/14/21.
//

import SwiftUI
import Shapes

struct GIItemRarityBackground: View {
  var rarity: GIItemRarity
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        Triquetra(strokeStyle: .init(lineWidth: dim * 0.12), inset: dim * 0.1, centered: true)
          .foregroundColor(Color.white.opacity(0.08))
          .rotationEffect(.degrees(180))
        Circle()
          .foregroundColor(.white.opacity(0.08))
          .frame(width: dim * 0.15, height: dim * 0.15)
          .offset(x: 0, y: -dim * 0.1)
      }
      .background(
        LinearGradient(colors: [Color(rarity.color.0), Color(rarity.color.1)], startPoint: .topLeading, endPoint: .bottomTrailing)
      )
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct GIItemRarityBackground_Previews: PreviewProvider {
  static var previews: some View {
    GIItemRarityBackground(rarity: .five)
      .frame(width: 256, height: 128)
      .previewLayout(.sizeThatFits)
  }
}
