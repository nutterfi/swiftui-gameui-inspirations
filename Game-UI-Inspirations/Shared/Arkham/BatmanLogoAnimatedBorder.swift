//
//  BatmanLogoAnimatedBorder.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 1/21/23.
//

import SwiftUI

struct BatmanLogoAnimatedBorder: View {
  @State private var trim: Float = 0.5
  @State private var isAnimating = false
  var body: some View {
    VStack {
      Slider(value: $trim)
      BatmanLogo()
        .trim(from: 0, to: CGFloat(trim))
        .stroke(style: StrokeStyle(lineWidth: 5, dash: [100, 10], dashPhase: isAnimating ? 110 : 0))
        .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: isAnimating)
        .background(
          BatmanLogo().fill(Color.black.opacity(0.3))
        )
    }
    .task {
      isAnimating.toggle()
    }
  }
}

struct BatmanLogoAnimatedBorder_Previews: PreviewProvider {
  static var previews: some View {
    BatmanLogoAnimatedBorder()
      .frame(width: 256, height: 256)
      .previewLayout(.sizeThatFits)
  }
}

