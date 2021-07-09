//
//  AphroditeBoon.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 7/8/21.
//

import SwiftUI

struct AphroditeBoon: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      // start in the center
      path.move(to: CGPoint(x: rect.midX, y: rect.midY))
      path.addLine(to: CGPoint(x: rect.width * 0.5, y: rect.height * 0.47))
      path.addLine(to: CGPoint(x: rect.width * 0.65, y: rect.height * 0.4))
      path.addQuadCurve(to: CGPoint(x: rect.width * 0.54, y: rect.height * 0.3), control: CGPoint(x: rect.width * 0.65, y: rect.height * 0.25))
      path.addLine(to: CGPoint(x: rect.width * 0.55, y: rect.height * 0.31))
      path.addLine(to: CGPoint(x: rect.width * 0.52, y: rect.height * 0.31))
      path.addLine(to: CGPoint(x: rect.width * 0.51, y: rect.height * 0.3))
      
      path.addQuadCurve(to: CGPoint(x: rect.width * 0.64, y: rect.height * 0.1), control: CGPoint(x: rect.width * 0.5, y: rect.height * 0.1))
      
      path.addLine(to: CGPoint(x: rect.width * 0.8, y: rect.height * 0.2))
      
      // rightmost point
      path.addLine(to: CGPoint(x: rect.width * 0.95, y: rect.height * 0.4)) //*
      
      path.addLine(to: CGPoint(x: rect.width * 0.8, y: rect.height * 0.6))
      path.addLine(to: CGPoint(x: rect.width * 0.73, y: rect.height * 0.6))
      
      // bottom point
      path.addLine(to: CGPoint(x: rect.width * 0.5, y: rect.height * 0.95))
      
      path.addLine(to: CGPoint(x: rect.width * 0.27, y: rect.height * 0.6))
      path.addLine(to: CGPoint(x: rect.width * 0.2, y: rect.height * 0.6))
      
      // leftmost point
      path.addLine(to: CGPoint(x: rect.width * 0.05, y: rect.height * 0.4)) //*
      
      path.addLine(to: CGPoint(x: rect.width * 0.2, y: rect.height * 0.2))
      
      path.addLine(to: CGPoint(x: rect.width * 0.36, y: rect.height * 0.1))
      
      path.addQuadCurve(to: CGPoint(x: rect.width * 0.49, y: rect.height * 0.3), control: CGPoint(x: rect.width * 0.5, y: rect.height * 0.1))
      
      path.addLine(to: CGPoint(x: rect.width * 0.48, y: rect.height * 0.31))
      path.addLine(to: CGPoint(x: rect.width * 0.45, y: rect.height * 0.31))
      path.addLine(to: CGPoint(x: rect.width * 0.46, y: rect.height * 0.3))

      path.addQuadCurve(to: CGPoint(x: rect.width * 0.35, y: rect.height * 0.4), control: CGPoint(x: rect.width * 0.35, y: rect.height * 0.25))
      path.addLine(to: CGPoint(x: rect.width * 0.5, y: rect.height * 0.47))
      path.closeSubpath()
    }
    
  }
  
    
}

struct AphroditeBoon_Previews: PreviewProvider {
    static var previews: some View {
        AphroditeBoon()
        .fill(.pink)
        .frame(width: 256, height: 256)
        .border(Color.black)
    }
}
