//
//  AresBoon.swift
//  AresBoon
//
//  Created by nutterfi on 7/31/21.
//

import SwiftUI

struct AresBoon: Shape {
  
  func swordHalf(rect: CGRect) -> Path {
    Path { path in
      // Sword
      path.move(to: CGPoint(x: rect.width * 0.5, y: rect.height * 0.05))
      path.addLine(to: CGPoint(x: rect.width * 0.58, y: rect.height * 0.2))
      path.addLine(to: CGPoint(x: rect.width * 0.52, y: rect.height * 0.5))
                   
      path.addLine(to: CGPoint(x: rect.width * 0.52, y: rect.height * 0.52))
      path.addLine(to: CGPoint(x: rect.width * 0.55, y: rect.height * 0.5))
      path.addLine(to: CGPoint(x: rect.width * 0.6, y: rect.height * 0.55))
      path.addLine(to: CGPoint(x: rect.width * 0.52, y: rect.height * 0.58))

      path.addLine(to: CGPoint(x: rect.width * 0.52, y: rect.height * 0.65))
      path.addLine(to: CGPoint(x: rect.width * 0.55, y: rect.height * 0.7))
      
      path.addLine(to: CGPoint(x: rect.width * 0.5, y: rect.height * 0.8))
      
      path.closeSubpath()
    }
  }
  
  func fire(rect: CGRect) -> Path {
    Path { path in
      path.move(to: CGPoint(x: rect.width * 0.25, y: rect.height * 0.3))
      path.addLine(to: CGPoint(x: rect.width * 0.4, y: rect.height * 0.45))
      path.addCurve(to: CGPoint(x: rect.width * 0.39, y: rect.height * 0.65),
                    control1: CGPoint(x: rect.width * 0.33, y: rect.height * 0.6),
                    control2: CGPoint(x: rect.width * 0.37, y: rect.height * 0.6))

      path.addLine(to: CGPoint(x: rect.width * 0.42, y: rect.height * 0.65))
      path.addLine(to: CGPoint(x: rect.width * 0.44, y: rect.height * 0.7))
      path.addLine(to: CGPoint(x: rect.width * 0.25, y: rect.height * 0.55))
      
      path.addLine(to: CGPoint(x: rect.width * 0.3, y: rect.height * 0.4))

      path.closeSubpath()
    }
  }
  
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.addPath(swordHalf(rect: rect))
      path.addPath(swordHalf(rect: rect).scale(x: -1, y: 1).path(in: rect))
      path.addPath(fire(rect: rect))
      path.addPath(fire(rect: rect).scale(x: -1, y: 1).path(in: rect))
    }
  }
    
}

struct AresBoon_Previews: PreviewProvider {
    static var previews: some View {
        AresBoon()
        .fill(Color.red)
        .border(Color.black)
        .frame(width: 256, height: 256)
    }
}
