//
//  AphroditeBoon.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 7/8/21.
//

import SwiftUI
import Shapes

struct AphroditeBoon: NFiShape {
  var inset: CGFloat = .zero
  func path(in rect: CGRect) -> Path {
    Path { path in
      // start in the center
      let insetRect = rect.insetBy(dx: inset, dy: inset)
      path.move(to: CGPoint(x: insetRect.midX, y: insetRect.midY))
      path.addLine(to: CGPoint(x: insetRect.minX + insetRect.width * 0.5, y: insetRect.minY + insetRect.height * 0.47))
      path.addLine(to: CGPoint(x: insetRect.minX + insetRect.width * 0.65, y: insetRect.minY + insetRect.height * 0.4))
      path.addQuadCurve(to: CGPoint(x: insetRect.minX +  insetRect.width * 0.54, y: insetRect.minY + insetRect.height * 0.3), control: CGPoint(x: insetRect.minX + insetRect.width * 0.65, y: insetRect.minY + insetRect.height * 0.25))
      path.addLine(to: CGPoint(x: insetRect.minX +  insetRect.width * 0.55, y: insetRect.minY + insetRect.height * 0.31))
      path.addLine(to: CGPoint(x: insetRect.minX +  insetRect.width * 0.52, y: insetRect.minY + insetRect.height * 0.31))
      path.addLine(to: CGPoint(x: insetRect.minX +  insetRect.width * 0.51, y: insetRect.minY + insetRect.height * 0.3))
      
      path.addQuadCurve(to: CGPoint(x: insetRect.minX +  insetRect.width * 0.64, y: insetRect.minY + insetRect.height * 0.1), control: CGPoint(x: insetRect.minX + insetRect.width * 0.5, y: insetRect.minY + insetRect.height * 0.1))
      
      path.addLine(to: CGPoint(x: insetRect.minX +  insetRect.width * 0.8, y: insetRect.minY + insetRect.height * 0.2))
      
      // rightmost point
      path.addLine(to: CGPoint(x: insetRect.minX + insetRect.width * 0.95, y: insetRect.minY + insetRect.height * 0.4)) //*
      
      path.addLine(to: CGPoint(x: insetRect.minX + insetRect.width * 0.8, y: insetRect.minY + insetRect.height * 0.6))
      path.addLine(to: CGPoint(x: insetRect.minX + insetRect.width * 0.73, y: insetRect.minY + insetRect.height * 0.6))
      
      // bottom point
      path.addLine(to: CGPoint(x: insetRect.minX + insetRect.width * 0.5, y: insetRect.minY + insetRect.height * 0.95))
      
      path.addLine(to: CGPoint(x: insetRect.minX + insetRect.width * 0.27, y: insetRect.minY + insetRect.height * 0.6))
      path.addLine(to: CGPoint(x: insetRect.minX + insetRect.width * 0.2, y: insetRect.minY + insetRect.height * 0.6))
      
      // leftmost point
      path.addLine(to: CGPoint(x: insetRect.minX + insetRect.width * 0.05, y: insetRect.minY + insetRect.height * 0.4)) //*
      
      path.addLine(to: CGPoint(x: insetRect.minX + insetRect.width * 0.2, y: insetRect.minY + insetRect.height * 0.2))
      
      path.addLine(to: CGPoint(x: insetRect.minX + insetRect.width * 0.36, y: insetRect.minY + insetRect.height * 0.1))
      
      path.addQuadCurve(to: CGPoint(x: insetRect.minX + insetRect.width * 0.49, y: insetRect.minY + insetRect.height * 0.3), control: CGPoint(x: insetRect.minX + insetRect.width * 0.5, y: insetRect.minY + insetRect.height * 0.1))
      
      path.addLine(to: CGPoint(x: insetRect.minX + insetRect.width * 0.48, y: insetRect.minY + insetRect.height * 0.31))
      path.addLine(to: CGPoint(x: insetRect.minX + insetRect.width * 0.45, y: insetRect.minY + insetRect.height * 0.31))
      path.addLine(to: CGPoint(x: insetRect.minX + insetRect.width * 0.46, y: insetRect.minY + insetRect.height * 0.3))

      path.addQuadCurve(to: CGPoint(x: insetRect.minX + insetRect.width * 0.35, y: insetRect.minY + insetRect.height * 0.4), control: CGPoint(x: insetRect.minX + insetRect.width * 0.35, y: insetRect.minY + insetRect.height * 0.25))
      path.addLine(to: CGPoint(x: insetRect.minX + insetRect.width * 0.5, y: insetRect.minY + insetRect.height * 0.47))
      path.closeSubpath()
    }
    
  }
  
    
}

struct AphroditeBoon_Previews: PreviewProvider {
    static var previews: some View {
      ZStack {
        Color.black
        AphroditeBoon()
          .foregroundColor(Color.white)
        AphroditeBoon()
          .inset(by: 10)
          .foregroundColor(Color.hadesAphroditePink)
      }
      .frame(width: 256, height: 256)
    }
}
