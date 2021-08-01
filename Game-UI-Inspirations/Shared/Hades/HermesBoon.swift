//
//  HermesBoon.swift
//  HermesBoon
//
//  Created by nutterfi on 7/31/21.
//

import SwiftUI

struct HermesBoon: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.move(to: CGPoint(x: rect.width * 0.15, y: rect.height * 0.95))
      path.addLine(to: CGPoint(x: rect.width * 0.1, y: rect.height * 0.35))
  
      // out top
      path.addQuadCurve(to: CGPoint(x: rect.width * 0.9, y: rect.height * 0.1), control: CGPoint(x: rect.width * 0.1, y: rect.height * 0.2))
      
      // in top
      path.addQuadCurve(to: CGPoint(x: rect.width * 0.3, y: rect.height * 0.35), control: CGPoint(x: rect.width * 0.95, y: rect.height * 0.15))
      // line
      path.addLine(to: CGPoint(x: rect.width * 0.3, y: rect.height * 0.38))
      
      path.addLine(to: CGPoint(x: rect.width * 0.83, y: rect.height * 0.22))

      // in top 2
      path.addQuadCurve(to: CGPoint(x: rect.width * 0.3, y: rect.height * 0.45), control: CGPoint(x: rect.width * 0.9, y: rect.height * 0.3))
      
      // line
      path.addLine(to: CGPoint(x: rect.width * 0.3, y: rect.height * 0.48))

      path.addLine(to: CGPoint(x: rect.width * 0.78, y: rect.height * 0.35))
      
      // in top 3
      path.addQuadCurve(to: CGPoint(x: rect.width * 0.3, y: rect.height * 0.55), control: CGPoint(x: rect.width * 0.8, y: rect.height * 0.45))
      
      // line
      path.addLine(to: CGPoint(x: rect.width * 0.3, y: rect.height * 0.58))

      path.addLine(to: CGPoint(x: rect.width * 0.72, y: rect.height * 0.47))
      // in top 4
      path.addQuadCurve(to: CGPoint(x: rect.width * 0.25, y: rect.height * 0.65), control: CGPoint(x: rect.width * 0.7, y: rect.height * 0.6))
      
      path.closeSubpath()
    }
  }
}

struct HermesBoon_Previews: PreviewProvider {
    static var previews: some View {
        HermesBoon()
        .stroke(Color.purple)
        .border(Color.black)
        .frame(width: 256, height: 256)
    }
}
