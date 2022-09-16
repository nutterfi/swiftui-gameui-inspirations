//
//  PolygonSegmentWrapAnimation.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 3/24/22.
//

import SwiftUI
import Shapes

/*
 1. Start with one segment in view
 2. Begin rotation about the center full 360
 3. MOAR segments show up behind the first one in a fan-opening style
 4. Each segment rotates around the center until they stop at their designated position
 5. ???
 6. End Goal is to have a polygon of any number of sides with triangle segments shaped like its cut like a pizza
 */

extension Shape {
  func strokeOverlay() -> some View {
    self
      .overlay(
        self.stroke()
      )
  }
}

// FIXME: provide support for repeating animations

struct PolygonSegmentWrapAnimation: View {
  @State private var animating = false
  
  var sides: Int
  var fillColor: Color = .hadesZeusOrange
    // FIXME: adjust calculations to make this duration follow expectations
  var duration: Double = 0.21
  
  var body: some View {
    GeometryReader { proxy in
      ZStack {
        let rect = proxy.frame(in: .local)
        let vertices = ConvexPolygon(sides: sides)
          .vertices(in: rect)
        
        if vertices.count >= 2 {
          let v0 = vertices[0]
          let v1 = vertices[1]
          
          ForEach(0..<sides, id:\.self) { index in
            let fIndex = CGFloat(index)
            let rotation: Angle = .degrees(animating ? 360.0/CGFloat(sides) * fIndex : 0)
            
            let path = Path { path in
              path.move(to: v0)
              path.addLine(to: v1)
              path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
              path.closeSubpath()
            }
            
            path
              .fill(fillColor)
              .overlay(
                path.stroke()
              )
            
            .rotationEffect(rotation)
            .animation(
              Animation
                .linear(duration: duration * Double(index))
              ,
              value: animating
            )
          }
        }
        
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
      .onAppear {
        animating = true
      }
    }
  }
}

struct PolygonSegmentWrapAnimation_Previews: PreviewProvider {
  static var previews: some View {
    PolygonSegmentWrapAnimation(sides: 8)
  }
}
