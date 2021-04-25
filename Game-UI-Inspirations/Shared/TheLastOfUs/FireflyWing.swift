//
//  FireflyWing.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 4/24/21.
//

import SwiftUI

struct FireflyWing: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.move(to: CGPoint(x: rect.width, y: rect.height * 0.2))
      path.addLine(to: CGPoint(x: rect.width, y: rect.height * 0.4))
      path.addLine(to: CGPoint(x: rect.width * 0.666, y: rect.height))
      path.addLine(to: CGPoint(x: rect.width * 0.333, y: rect.height * 0.8))
      path.addLine(to: CGPoint(x: rect.width * 0.9, y: rect.height * 0.4))
      path.addLine(to: CGPoint(x: rect.width * 0.9, y: rect.height * 0.35))
      path.addLine(to: CGPoint(x: rect.width * 0.2, y: rect.height * 0.5))
      path.addLine(to: CGPoint(x: 0, y: rect.height * 0.24))
      path.addLine(to: CGPoint(x: rect.width * 0.05, y: rect.height * 0.2))
      path.addLine(to: CGPoint(x: rect.width * 0.95, y: rect.height * 0.2))
      path.addLine(to: CGPoint(x: rect.width * 0.85, y: 0))
      path.closeSubpath()
    }
  }
  
  
}

struct FireflyWing_Previews: PreviewProvider {
    static var previews: some View {
        FireflyWing()
          .fill()
          .frame(width: 200, height: 100)
    }
}
