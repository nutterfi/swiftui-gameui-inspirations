//
//  AnimatedStrokeStyledCircleDemo.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 9/3/22.
//

import SwiftUI
import Shapes
// WIP

struct AnimatedStrokeStyledCircleDemo: View {
  @State private var animating = false
  @State private var rotation: Float = 0
  
    var body: some View {
      VStack {
        Slider(value: $rotation)
        GeometryReader { proxy in
          ZStack {
            let outer = StrokeStyledCircle(
              numberOfSegments: 15,
              dashPattern: [1, 1],
              lineWidth: 20
            )
              .inset(by: 5)
              .path(in: proxy.frame(in: .local).insetBy(dx: 5, dy: 5))
            
            let inner = StrokeStyledCircle(
              numberOfSegments: 15,
              dashPattern: [1, 3],
              lineWidth: 20
            )
              .inset(by: 10)
              .rotation(.degrees(360 * Double(rotation)))

              .path(in: proxy.frame(in: .local).insetBy(dx: 10, dy: 10))
            
              let difference =
              outer.cgPath.subtracting(inner.cgPath)
              
              let x = Path(difference)
              x
              .stroke(Color.red, lineWidth: 5)
              .animation(.linear(duration: 1).repeatForever(), value: animating)
          }
          .frame(width: proxy.size.width, height: proxy.size.height)
          .task {
            animating.toggle()
          }
        }
      }
    }
}

struct AnimatedStrokeStyledCircleDemo_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedStrokeStyledCircleDemo()
    }
}
