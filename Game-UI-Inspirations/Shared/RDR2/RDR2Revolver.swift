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
      path.addArc(center: mid, radius: dim * 0.5, startAngle: .zero, endAngle: .init(degrees: 360), clockwise: false)
      path.closeSubpath()
      
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
        
        path.addPath(p)
        path.closeSubpath()
      }
      
      innerVertices.forEach { vertex in
        var p = Path()
        p.addArc(center: vertex, radius: dim * 0.13, startAngle: .zero, endAngle: .init(degrees: 360), clockwise: true)
        
        path.addPath(p)
        path.closeSubpath()
      }
      
      var p = Path()
      p.addArc(center: mid, radius: dim * 0.06, startAngle: .zero, endAngle: .init(degrees: 360), clockwise: true)
      path.addPath(p)
    }
  }
}

struct RDR2Revolver_Previews: PreviewProvider {
    static var previews: some View {
      RDR2Revolver()
        .fill(Color.white)
        .frame(width: 256, height: 256)
        .clipShape(Circle().inset(by: 1))
        .background(Color.red)
        .previewLayout(.sizeThatFits)
    }
}
