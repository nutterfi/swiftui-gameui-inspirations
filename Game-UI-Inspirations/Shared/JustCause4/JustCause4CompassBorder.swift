//
//  JustCause4CompassBorder.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 4/21/22.
//

import Foundation
import SwiftUI

// FIXME: This effect is broken for non-rectangular shapes

struct JustCause4CompassBorder: Shape {
  var ringThicknessRatio: CGFloat = 0.1
  
  func halfRing(in rect: CGRect) -> Path {
    Path { path in
      
      let minHalf = min(rect.width, rect.height) * 0.5
      let inset = ringThicknessRatio * 0.5
      
      path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: minHalf - inset * minHalf, startAngle: .radians(0.75 * .pi), endAngle: .radians(1.75 * .pi), clockwise: false)
    }
  }
  
  func wedge(in rect: CGRect) -> Path {
    Path { path in
      
      let minHalf = min(rect.width, rect.height) * 0.5
      let inset = minHalf * 0.2

      path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
      path.addLine(to: CGPoint(x: rect.minX + inset, y: rect.height * 0.8))
      path.addLine(to: CGPoint(x: path.currentPoint!.x + 0.1 * minHalf, y: path.currentPoint!.y + 0.1 * minHalf))
      path.closeSubpath()
    }
  }
  
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.addPath(halfPath(in: rect))
      
      let hRot = halfPath(in: rect).rotation(.radians(.pi))
        .path(in: rect)
      
      path.addPath(hRot)
    }
  }
  
  func halfPath(in rect: CGRect) -> Path {
    Path { path in
      let minHalf = min(rect.width, rect.height) * 0.5
      let cgArc = halfRing(in: rect)
        .strokedPath(
          StrokeStyle(lineWidth: minHalf * ringThicknessRatio)
        )
        .cgPath
      
      let cgWedge = wedge(in: rect).cgPath
      let newRect = CGRect(
        origin: CGPoint(
          x: rect.maxX - 0.2 * rect.width,
          y: rect.minY),
        size: CGSize(width: 0.2 * rect.width, height: 0.2 * rect.height)
      )
      
      let newRectPath = Path(roundedRect: newRect, cornerRadius: 0).cgPath
      
      let union = cgArc
        .union(cgWedge)
        .subtracting(
          newRectPath
        )
      
      let unionPath = Path(union)
      path.addPath(unionPath)

    }
  }
  
}

struct JustCause4CompassBorder_Previews: PreviewProvider {
    static var previews: some View {
      JustCause4CompassBorder()
        .border(Color.black)
        .frame(width: 256, height: 256)
    }
}

