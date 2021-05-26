//
//  DiamondDog.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/25/21.
//

import SwiftUI

struct DiamondDog: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      // start at snout
      path.move(to: CGPoint(x: 0, y: rect.height * 0.5))
      path.addLine(to: CGPoint(x: rect.width * 1.5 / 5, y: rect.height * 0.3))
      path.addLine(to: CGPoint(x: rect.width * 2 / 5, y: rect.height * 0.2))
      path.addCurve(to: CGPoint(x: rect.width, y: rect.height * 0.5),
                    control1: CGPoint(x: rect.width * 0.44, y: rect.height * 0.125),
                    control2: CGPoint(x: rect.width * 0.85, y: rect.height * -0.15))
      path.addLine(to: CGPoint(x: rect.width * 0.8, y: rect.height * 0.85))
      path.addLine(to: CGPoint(x: rect.width * 0.5, y: rect.height * 0.9))
      path.addLine(to: CGPoint(x: rect.width * 0.45, y: rect.height * 0.75))
      path.addLine(to: CGPoint(x: rect.width * 0.4, y: rect.height * 0.75))
      path.addLine(to: CGPoint(x: rect.width * 0.35, y: rect.height * 0.8))
      path.addLine(to: CGPoint(x: rect.width * 0.15, y: rect.height * 0.8))
      path.closeSubpath()
      
      
    }
  }
  
}

struct DiamondDog_Previews: PreviewProvider {
    static var previews: some View {
        DiamondDog()
          .stroke()
          .frame(width: 250, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
          .border(Color.black)
    }
}
