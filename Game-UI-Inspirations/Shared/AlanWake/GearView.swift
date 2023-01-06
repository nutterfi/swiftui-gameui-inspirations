//
//  GearView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 12/8/22.
//

import SwiftUI
import Shapes

struct Gear: Shape {
  var teeth: Int = 10
  var spokes: Int = 5
  
  func path(in rect: CGRect) -> Path {
    Path { path in
      let dim = min(rect.width, rect.height)
      let teeth = StrokeStyledCircle(
        numberOfSegments: teeth,
        dashPattern: [1, 2],
        lineWidthRatio: 0.1
      )
      path.addPath(teeth.path(in: rect))
      
      
      let ring = StrokeStyledCircle(
        numberOfSegments: 1,
        dashPattern: [],
        lineWidthRatio: 0.1
      )
        .inset(by: dim * 0.1)
      
      path.addPath(ring.path(in: rect))
      
      let innerRing = Circle().inset(by: 0.18 * dim)
        
      var cgRing = innerRing.path(in: rect).cgPath
      
      let polygon = ConvexPolygon(sides: spokes)
      let vertices = polygon
        .vertices(in: rect.insetBy(dx: dim * 0.05, dy: dim * 0.05))
     
      
      vertices.forEach { vertex in
        var p = Path()
        p.addArc(center: vertex, radius: dim * 0.2, startAngle: .zero, endAngle: .init(degrees: 360), clockwise: true)
        
        cgRing = cgRing.subtracting(p.cgPath)
      }
      
      let tinyCircle = Circle().inset(by: 0.4 * dim)
      let cgTiny = tinyCircle.path(in: rect).cgPath
      
      cgRing = cgRing.subtracting(cgTiny)
      
      path.addPath(Path(cgRing))
    }
  }
  
}

struct GearView: View {
  @State private var isAnimating = false
  var duration = 5.0
  var body: some View {
    VStack {
      HStack(spacing: -20) {
        Gear()
          .foregroundColor(.green)
          .rotationEffect(.radians(isAnimating ? 2 * .pi : .zero))
        .animation(Animation.linear(duration: duration).repeatForever(autoreverses: false), value: isAnimating)
        Gear()
          .stroke()
          .foregroundColor(.blue)
          .rotationEffect(.radians(isAnimating ? -2 * .pi : .zero))
        .animation(Animation.linear(duration: duration).repeatForever(autoreverses: false), value: isAnimating)
      }
      
      Gear(teeth: 20, spokes: 6)
        .foregroundColor(.red)
        .rotationEffect(.radians(isAnimating ? -2 * .pi : .zero))
      .animation(Animation.linear(duration: duration).repeatForever(autoreverses: false), value: isAnimating)
    }
    .background(Color.gray)
    .task {
      isAnimating.toggle()
    }
  }
}

struct GearView_Previews: PreviewProvider {
  static var previews: some View {
    GearView()
  }
}
