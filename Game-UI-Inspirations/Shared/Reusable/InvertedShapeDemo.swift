//
//  InvertedShape.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 1/22/23.
//

import SwiftUI
import Shapes

struct InvertedShapeDemo: View {
  @State var isAnimating = false

  var body: some View {
    ZStack {
      Color.purple.ignoresSafeArea()
      Text(isAnimating ? "TEST" : "HELLO TWITCH")
        .font(.system(size: 87))
      InvertedShape(shape: Reuleaux.triangle)
        .foregroundStyle(LinearGradient(colors: [.red, .black, .green], startPoint: .topLeading, endPoint: .bottomTrailing))
        .opacity(0.9)
        .blur(radius: isAnimating ? 5 : 0)
        .animation(.linear(duration: 1).repeatForever(), value: isAnimating)
        .frame(width: 256, height: 256)

      Reuleaux.triangle
        .invert(inset: isAnimating ? 20 : 0)
        .fill(Color.orange)
        .animation(.linear(duration: 1).repeatForever(), value: isAnimating)
        .frame(width: 128, height: 256)
      
    }
    .onAppear {
      isAnimating = true
    }
  }
}

struct InvertedShape_Previews: PreviewProvider {
  @State static var isAnimating = false
  static var previews: some View {
    InvertedShapeDemo()
  }
}
