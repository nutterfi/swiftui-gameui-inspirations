//
//  OWPlayerWaitingIcon.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 9/20/22.
//

import SwiftUI
import Shapes

struct OWPlayerWaitingIcon: View {
  @State private var animating = false
  var repeats: Int = 5
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        Color.acoBlue
        ForEach(0..<repeats, id: \.self) { index in
          let opacity = 0.1 * Double(index)
          Torx(sides: 6, controlPointRatio: 0)
            .inset(by: 0.05 * dim * Double(index))
            .foregroundColor(.white)
            .opacity(opacity)
        }
        Torx(sides: 6, controlPointRatio: 0)
          .inset(by: dim * 0.25)
        
        let vertices = ConvexPolygon(sides: 6)
          .vertices(
            in: proxy.frame(in: .local).insetBy(dx: 0.4 * dim, dy: 0.4 * dim),
            offset: .radians(.pi / 2)
          )
        
        ForEach(0..<vertices.count, id:\.self) { index in
          let vertex = vertices[index]
          ConvexPolygon(sides: 6)
            .offset(
              x: -dim * 0.5 + vertex.x,
              y: -dim * 0.5 + vertex.y
            )
            .foregroundColor(.gray)
            .frame(width: dim * 0.1, height: dim * 0.1)
            .opacity(animating ? 0 : 1)
            .scaleEffect(animating ? 0.8 : 1)
            .animation(
              Animation.linear(duration: 0.25)
//                .delay(2)
                // TODO: Research sequences of animations in SwiftUI
                .delay(Double(index + 1) * 0.25)
                .repeatForever()
              , value: animating
            )

        }
        
        ConvexPolygon(sides: 6)
          .foregroundColor(.gray)
          .frame(width: dim * 0.1, height: dim * 0.1)
          .opacity(animating ? 0 : 1)
          .scaleEffect(animating ? 0.8 : 1)
          .animation(
            Animation.linear(duration: 0.25)
              .delay(2)
              .repeatForever()
            , value: animating
          )
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
    .task {
      animating.toggle()
    }
  }
}

struct OWPlayerWaitingIcon_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      Color.red
        .frame(width: 256, height: 256)
      OWPlayerWaitingIcon()
      .frame(width: 256, height: 256)
    }
    .previewLayout(.sizeThatFits)
  }
}
