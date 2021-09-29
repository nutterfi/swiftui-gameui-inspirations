//
//  CelesteDeathAnimation.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 9/28/21.
//

import SwiftUI
import Shapes
// TODO: Pixelate!

struct CelesteDeathAnimation: View {
  @State private var isAnimating: Bool = false
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          // STEP 1 - Ring of death - WIP
          // Circle and Ring that expand from a ball of death
//          ZStack {
//            Circle()
//              .strokeBorder(Color.red, lineWidth: dim * 0.1)
//              .scaleEffect(isAnimating ? 1 : 0)
//              .animation(Animation.easeOut(duration: 0.5)
//                          .repeatForever(autoreverses: false)
//                          ,value: isAnimating)
//              .opacity(isAnimating ? 0 : 1)
//              .animation(Animation.linear(duration: 2)
//                          .repeatForever(autoreverses: false), value: isAnimating)
//          }
          // STEP 2 - COMPLETE
          // 8 circles placed in a larger circle formation
          // alternate from red to white
          // rotate clockwise
          // circle expands
          // smaller circles decrease in size until they disappear
          let frame = dim
          let vertices = ConvexPolygon(sides: 8).vertices(in: CGRect(x: 0, y: 0, width: frame, height: frame))
          ZStack {
            ConvexPolygon(sides: 8)
              .frame(width: frame, height: frame)
              .foregroundColor(.clear)
            
            ForEach(0..<vertices.count, id:\.self) { index in
              let vertex = vertices[index]
              Circle()
                .foregroundColor(isAnimating ? .red : .white)
                .animation(Animation.linear(duration: 0.25)
                            .delay(0.5)
                            .repeatForever(autoreverses: false), value: isAnimating)
                .frame(width: frame / 2, height: frame / 2)
                .scaleEffect(isAnimating ? 0 : 1)
                .animation(Animation.easeOut(duration: 1)
                            .delay(0.5)
                            .repeatForever(autoreverses: false), value: isAnimating)
                .offset(x: -frame * 0.5 + vertex.x, y: -frame * 0.5 + vertex.y)

            }
          }
          .opacity(isAnimating ? 1 : 0)
          .animation(Animation.linear(duration: 1)
                      .delay(0.5)
                      .repeatForever(autoreverses: false), value: isAnimating)
          .scaleEffect(isAnimating ? 1 : 0.5)
          .animation(Animation.easeOut(duration: 1)
                      .delay(0.5)
                      .repeatForever(autoreverses: false), value: isAnimating)
          .rotationEffect(.radians(isAnimating ? .pi / 2 : 0))
          .animation(Animation.easeOut(duration: 1)
                      .delay(0.5)
                      .repeatForever(autoreverses: false), value: isAnimating)
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
      .onAppear {
        isAnimating = true
      }
    }
}

struct CelesteDeathAnimation_Previews: PreviewProvider {
    static var previews: some View {
      ZStack {
        CelesteDeathAnimation()
          .padding()
      }
      .background(Color.black)
    }
}
