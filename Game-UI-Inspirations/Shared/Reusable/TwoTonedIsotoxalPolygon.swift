//
//  TwoTonedIsotoxalPolygon.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 1/4/22.
//

import SwiftUI
import Shapes

struct TwoTonedIsotoxalPolygon: View {
  var sides: Int
  var innerRadius: Float = 0.38
  var color1: Color
  var color2: Color
  
  var body: some View {
    GeometryReader { proxy in
      let rect = proxy.frame(in: .local)
      
      ZStack {
        // includes outer(star) and inner (pentagon) vertices
        // use the outer points as the maximum
        // compute the midpoint of the pentagon vertices
        // one way to do this is by getting point-1 and point+1 (if point = star tip)
        // and taking point-1.x + point+1.x / 2, same for y
        // the annoying thing is having to determine the indeces of the vertices for each triangle
        // TOP [0] is the max
        // midpoint (computed above) is the min
        // actual is min + fraction of the distance between min and max
        let vertices = IsotoxalPolygon(sides: sides * 2, innerRadius: CGFloat(innerRadius))
          .vertices(in: proxy.frame(in: .local))
        
        // 2 paths per subgrade, to draw symmetric triangles with different colors
        // location of the point of the star needs to be between the inner pentagon edge and the star point
        //vertices[0], vertices[2], vertices[4], vertices[6]
        
        let maxPoint = vertices.first!
        let leftPoint = vertices[vertices.count - 1]
        let rightPoint = vertices[1]
        let minPoint = CGPoint(x: (leftPoint.x + rightPoint.x) * 0.5, y: (leftPoint.y + rightPoint.y) * 0.5) // midpoint actually...
        
        ForEach(0..<sides, id:\.self) { index in
          let fIndex = CGFloat(index)
          let rotation: Angle = .degrees(360.0/CGFloat(sides) * fIndex)
          let percentage = 1.0//viewModel.value(at: index)
          
          let actualPoint = CGPoint(x: minPoint.x, y: minPoint.y - percentage * abs(maxPoint.y - minPoint.y))
          
          Path { path in
            path.move(to: actualPoint)
            path.addLine(to: vertices[1])
            path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
            path.closeSubpath()
          }
          .fill(color1)
          .rotationEffect(rotation)
          
          Path { path in
            path.move(to: actualPoint)
            path.addLine(to: vertices[vertices.count - 1])
            path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
            path.closeSubpath()
          }
          .fill(color2)
          .rotationEffect(rotation)
        }
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct TwoTonedIsotoxalPolygon_Previews: PreviewProvider {
  static var previews: some View {
    TwoTonedIsotoxalPolygon(
      sides: 4,
      innerRadius: 0.2,
      color1: Color.porterlightGreen,
      color2: Color.porterDarkGreen
    )
  }
}
