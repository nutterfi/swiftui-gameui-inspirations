//
//  TrebleClef.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 3/8/22.
//

import SwiftUI

struct TrebleClef: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.move(to: CGPoint(x: rect.minX + rect.width / 3, y: rect.minY + rect.height * 2 / 3))
      
      // step 1
      path.addQuadCurve(
        to: CGPoint(x: rect.midX, y: rect.midY),
        control: CGPoint(x: path.currentPoint!.x, y: path.currentPoint!.y - 0.1 * rect.height)
      )
      
      path.addQuadCurve(
        to: CGPoint(x: rect.minX + rect.width * 2 / 3, y: rect.minY + rect.height * 2 / 3),
        control: CGPoint(x: rect.minX + rect.width * 2 / 3, y: path.currentPoint!.y)
      )
      
      // step 2
      path.addQuadCurve(
        to: CGPoint(x: rect.minX + rect.width / 6, y: rect.minY + rect.height * 2 / 3),
        control: CGPoint(x: rect.minX + rect.width * 0.5, y: path.currentPoint!.y + 0.25 * rect.height)
      )
      
      // step 3
      path.addQuadCurve(
        to: CGPoint(x: rect.minX + rect.width * 0.4, y: rect.minY + rect.height / 3),
        control: CGPoint(x: rect.minX + rect.width / 6, y: path.currentPoint!.y - 0.24 * rect.height)
      )
      // step 4
      path.addCurve(
        to: path.currentPoint!,
        control1: CGPoint(x: rect.minX + rect.width * 4 / 6, y: path.currentPoint!.y - 0.35 * rect.height),
        control2: CGPoint(x: rect.minX + rect.width * 1.5 / 6, y: path.currentPoint!.y - 0.35 * rect.height)
      )
      // step 5
      path.addLine(to: CGPoint(x: rect.minX + rect.width * 0.55, y: rect.minY + rect.height * 0.9))
      
      // step 6
      path.addCurve(
        to: CGPoint(x: path.currentPoint!.x - 0.2 * rect.width, y: path.currentPoint!.y),
        control1: CGPoint(x: rect.midX, y: path.currentPoint!.y + 0.1 * rect.height),
        control2: CGPoint(x: rect.minX + rect.width * 1.5 / 6, y: path.currentPoint!.y + 0.1 * rect.height)
      )
      
      // step 7
      var p = Path()
      
      p.addEllipse(in: CGRect(origin: path.currentPoint!, size: CGSize(width: rect.width * 0.1, height: rect.width * 0.1)))
      path.addPath(p)
    }
  }
}

struct TrebleClef_Previews: PreviewProvider {
    static var previews: some View {
        TrebleClef()
        .stroke(lineWidth: 20)
    }
}
