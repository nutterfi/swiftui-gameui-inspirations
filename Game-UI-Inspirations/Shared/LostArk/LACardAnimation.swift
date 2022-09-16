//
//  LACardAnimation.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 9/10/22.
//

import SwiftUI
import Shapes

struct LACardAnimation: View {
  @State private var animating = false
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          LinearGradient(colors: [.blue, .purple], startPoint: .bottomLeading, endPoint: .topTrailing)
          ArcanistIcon()
          let vertices = ConvexPolygon(sides: 12).vertices(in: proxy.frame(in: .local))
          ForEach(0..<vertices.count, id: \.self) { index in
            let v = vertices[index]
            LACardBack()
              .frame(width: dim * 0.1, height: dim * 0.15)
              .rotationEffect(animating ? .zero : .degrees(360))
            // TODO: Finalize these options
              .animation(.easeInOut(duration: 2).repeatForever(), value: animating)
              
              .offset(x: animating ? .zero : -dim * 0.5 + v.x,
                      y: animating ? .zero : -dim * 0.5 + v.y)
              .angularOffset(magnitude: animating ? 0 : dim * 0.5, angle: .degrees(10 * Double(index)))
              .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: animating)
          }
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
      .task {
        animating.toggle()
      }
    }
}

struct LACardAnimation_Previews: PreviewProvider {
    static var previews: some View {
        LACardAnimation()
        .frame(width: 512, height: 512)
        .previewLayout(.sizeThatFits)
    }
}
