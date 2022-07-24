//
//  RDR2Revolver.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 10/23/21.
//

import SwiftUI
import Shapes

struct RDR2Revolver: Shape {
  
  func path(in rect: CGRect) -> Path {
    let dim = min(rect.width, rect.height)
    let mid = CGPoint(x: rect.midX, y: rect.midY)
    return Path { path in
      
      // start with a circle
      var firstCircle = Path()
      firstCircle.addArc(center: mid, radius: dim * 0.5, startAngle: .zero, endAngle: .init(degrees: 360), clockwise: false)
      firstCircle.closeSubpath()
      var cgFirstCircle = firstCircle.cgPath
      
      // get six points around a circle and use them as centers for smaller circles
      
      let polygon = ConvexPolygon(sides: 6)
      let innerVertices = polygon
        .vertices(in: rect.insetBy(dx: dim * 0.2, dy: dim * 0.2))
      let outerVertices = polygon.vertices(
        in: rect.insetBy(dx: -0.06 * dim, dy: -0.06 * dim),
        offset: .radians(.pi / 6)
      )
      
      outerVertices.forEach { vertex in
        var p = Path()
        p.addArc(center: vertex, radius: dim * 0.14, startAngle: .zero, endAngle: .init(degrees: 360), clockwise: true)
        
        cgFirstCircle = cgFirstCircle.subtracting(p.cgPath)
      }
      
      innerVertices.forEach { vertex in
        var p = Path()
        p.addArc(center: vertex, radius: dim * 0.13, startAngle: .zero, endAngle: .init(degrees: 360), clockwise: true)
        
        cgFirstCircle = cgFirstCircle.subtracting(p.cgPath)
      }
      
      var p = Path()
      p.addArc(center: mid, radius: dim * 0.06, startAngle: .zero, endAngle: .init(degrees: 360), clockwise: true)
      
      cgFirstCircle = cgFirstCircle.subtracting(p.cgPath)
      
      path.addPath(Path(cgFirstCircle))
    }
  }
}

struct RDR2Revolver_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.red.ignoresSafeArea()
      RDR2Revolver()
        .stroke(Color.white, lineWidth: 5)
        .frame(width: 256, height: 256)
      .previewLayout(.sizeThatFits)
    }
  }
}
