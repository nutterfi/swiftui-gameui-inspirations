//
//  LineSegmentGroup.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 12/17/21.
//

import SwiftUI

/// Draws line segments with pairs of normalized points
struct LineSegmentGroup: Shape {
  var lineSegments: [(CGPoint, CGPoint)]

  func path(in rect: CGRect) -> Path {
    Path { path in
      lineSegments.forEach { first, second in
        var p = Path()
        p.move(to: CGPoint(x: first.x * rect.width, y: first.y * rect.height))
        p.addLine(to: CGPoint(x: second.x * rect.width, y: second.y * rect.height))
        p.closeSubpath()
        path.addPath(p)
      }
    }
  }  
  
}

struct TreeBranch_Previews: PreviewProvider {
    static var previews: some View {
      LineSegmentGroup(lineSegments: [
        (CGPoint(x: 0, y: 0.25), CGPoint(x: 0.25, y: 0.25)),
        (CGPoint(x: 0.25, y: 0.5), CGPoint(x: 0.5, y: 0.5)),
        (CGPoint(x: 0.5, y: 0.75), CGPoint(x: 0.75, y: 0.75)),
        (CGPoint(x: 0.75, y: 1), CGPoint(x: 1, y: 1)),
      ]
      )
        .stroke(lineWidth: 10)
        .frame(width: 256, height: 256)
        .previewLayout(.sizeThatFits)
    }
}
