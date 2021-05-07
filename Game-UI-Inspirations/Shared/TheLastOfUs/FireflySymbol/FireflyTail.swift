//
//  FireflyTail.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 4/24/21.
//

import SwiftUI

struct FireflyTail: Shape {
  func path(in rect: CGRect) -> Path {
    let start = CGPoint(x: rect.width, y: 0.15 * rect.height)
    return Path { path in
      path.move(to: start)
      path.addLine(to: CGPoint(x: rect.width, y: rect.height))
      path.addLine(to: CGPoint(x: rect.width * 0.8, y: rect.height * 0.9))
      path.addLine(to: CGPoint(x: rect.width * 0.8, y: rect.height * 0.3))
      path.addLine(to: CGPoint(x: rect.width * 0.333, y: rect.height * 0.5))
      path.addLine(to: CGPoint(x: rect.width * 0.7, y: rect.height * 0.15))
      path.addLine(to: CGPoint(x: 0, y: rect.height * 0.25))
      path.addLine(to: CGPoint(x: rect.width * 0.7, y: 0))
      path.addQuadCurve(to: start, control: CGPoint(x: rect.width * 0.7, y: rect.height * 0.1))
    }
  }
  
  
}

struct FireflyTail_Previews: PreviewProvider {
    static var previews: some View {
        FireflyTail()
          .fill(Color.black)
          .frame(width: 50, height: 200)
    }
}
