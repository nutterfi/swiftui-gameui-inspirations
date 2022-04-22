//
//  LostArkLogo.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 4/21/22.
//

import Foundation
import SwiftUI

struct LostArkLogo: Shape {
  
  func half(in rect: CGRect) -> Path {
    Path { path in
      path.move(to: CGPoint(x: rect.width * 0.01, y: rect.height * 0.01))
      path.addLine(to: CGPoint(x: rect.width * 0.45, y: rect.height * 0.1))
      path.addLine(to: CGPoint(x: rect.width * 0.48, y: rect.height * 0.2))
      path.addLine(to: CGPoint(x: rect.width * 0.48, y: rect.height * 0.95))
      path.addLine(to: CGPoint(x: rect.width * 0.46, y: rect.height * 0.9))
      path.addLine(to: CGPoint(x: rect.width * 0.42, y: rect.height * 0.3))
      path.addLine(to: CGPoint(x: rect.width * 0.4, y: rect.height * 0.25))
      path.addLine(to: CGPoint(x: rect.width * 0.42, y: rect.height * 0.2))
      path.addQuadCurve(
        to: CGPoint(x: rect.width * 0.415, y: rect.height * 0.15),
        control: CGPoint(x: rect.width * 0.42, y: rect.height * 0.16)
      )
      path.addCurve(
        to: CGPoint(x: rect.width * 0.15, y: rect.height * 0.25),
        control1: CGPoint(x: rect.width * 0.25, y: rect.height * 0.08),
        control2: CGPoint(x: rect.width * 0.1, y: rect.height * 0.1)
      )
      path.closeSubpath()
    }
  }
  
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.addPath(half(in: rect))
      path.addPath(half(in: rect).scale(x: -1, y: 1).path(in: rect))
    }
  }
  
}

struct LostArkLogo_Previews: PreviewProvider {
    static var previews: some View {
      LostArkLogo()
        .fill()
        .border(Color.black)
        .frame(width: 256, height: 256)
    }
}

