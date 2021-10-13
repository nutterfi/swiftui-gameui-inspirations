//
//  RoundedCornerRectangle.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 10/12/21.
//

import SwiftUI
import Shapes

struct RoundedCornerRectangle: NFiShape {
  
  enum Corner {
    case topLeft, topRight, bottomLeft, bottomRight
  }
  
  var corners: [Corner]
  var inset: CGFloat = .zero
  
  public var cornerRadius: CGFloat
  
  init(cornerRadius: CGFloat, corners: [Corner] = []) {
    self.cornerRadius = cornerRadius
    self.corners = corners
  }
  
  func path(in rect: CGRect) -> Path {
    let aRect = rect.insetBy(dx: inset, dy: inset)
    
    return Path { path in
      // starting point
      path.move(to: CGPoint(x: aRect.minX, y: aRect.minY + cornerRadius))
      
      if corners.contains(.topLeft) {
        path.addArc(center: CGPoint(x: aRect.minX + cornerRadius, y: aRect.minY + cornerRadius), radius: CGFloat(cornerRadius), startAngle: .init(radians: .pi), endAngle: .init(radians: -.pi / 2), clockwise: false)
      } else {
        path.addLine(to: CGPoint(x: aRect.minX, y: aRect.minY))
      }
      
      // draw line to the right
      path.addLine(to: CGPoint(x: aRect.maxX - CGFloat(cornerRadius), y: aRect.minY))
      
      if corners.contains(.topRight) {
        
        path.addArc(center: CGPoint(x: aRect.maxX - cornerRadius, y: aRect.minY + cornerRadius), radius: CGFloat(cornerRadius), startAngle: .init(radians: .pi), endAngle: .zero, clockwise: false)
      } else {
        path.addLine(to: CGPoint(x: aRect.maxX, y: aRect.minY))
      }
      
      // draw line down
      path.addLine(to: CGPoint(x: aRect.maxX, y: aRect.maxY - CGFloat(cornerRadius)))
      
      if corners.contains(.bottomRight) {
        path.addArc(center: CGPoint(x: aRect.maxX - cornerRadius, y: aRect.maxY - cornerRadius), radius: CGFloat(cornerRadius), startAngle: .zero, endAngle: .init(radians: .pi / 2), clockwise: false)
      } else {
        path.addLine(to: CGPoint(x: aRect.maxX, y: aRect.maxY))
      }
      
      // draw line left
      path.addLine(to: CGPoint(x: aRect.minX + CGFloat(cornerRadius), y: aRect.maxY))
      
      if corners.contains(.bottomLeft) {
        path.addArc(center: CGPoint(x: aRect.minX + cornerRadius, y: aRect.maxY - cornerRadius), radius: CGFloat(cornerRadius), startAngle: .init(radians: .pi / 2), endAngle: .init(radians: .pi), clockwise: false)
      } else {
        path.addLine(to: CGPoint(x: aRect.minX, y: aRect.maxY))
      }
      
      // draw line up
      path.addLine(to: CGPoint(x: aRect.minX, y: aRect.minY + cornerRadius))
      path.closeSubpath()
    }
  }
  
  
  
}

struct RoundedCornerRectangle_Previews: PreviewProvider {
    static var previews: some View {
      RoundedCornerRectangle(cornerRadius: 32, corners: [.topLeft, .topRight, .bottomRight])
      .frame(width: 256, height: 256)
      .previewLayout(.sizeThatFits)
    }
}
