//
//  RibbonBanner.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/25/21.
//

import SwiftUI

struct RibbonBanner: Shape {
  /*
    CGPoint(x: rect.width * 1, y: rect.height * 1)
  */
  
  func path(in rect: CGRect) -> Path {
    Path { path in
      // main
      path.move(to: CGPoint(x: rect.width * 1.0 / 6, y: rect.height * 1.0 / 3))
      path.addQuadCurve(to: CGPoint(x: rect.width * 5.0 / 6, y: rect.height * 1.0 / 3), control: CGPoint(x: rect.width * 0.5, y: rect.height * 0.5))
      path.addLine(to: CGPoint(x: rect.width * 11.0 / 12, y: rect.height * 2.0 / 3))
      path.addQuadCurve(to: CGPoint(x: rect.width * 1.0 / 12, y: rect.height * 2.0 / 3), control: CGPoint(x: rect.width * 0.5, y: rect.height))
      path.closeSubpath()
      
      // left ribbon
      path.move(to: CGPoint(x: rect.width * 1.0 / 6, y: rect.height * 1.0 / 3))
      path.addLine(to: CGPoint(x: rect.width * 1.5 / 6, y: rect.height * 2.0 / 9))
      path.addLine(to: CGPoint(x: rect.width * 1.5 / 6, y: rect.height * 7.0 / 18))
      
      path.move(to: CGPoint(x: rect.width * 1.5 / 6, y: rect.height * 2.0 / 9))
      path.addLine(to: CGPoint(x: rect.width * 1.0 / 18, y: rect.height * 1.0 / 6))
      path.addLine(to: CGPoint(x: rect.width * 1.0 / 12, y: rect.height * 3.0 / 9))
      path.addLine(to: CGPoint(x: rect.width * 0, y: rect.height * 4.0 / 9))
      path.addLine(to: CGPoint(x: rect.width * 1.4 / 12, y: rect.height * 5.0 / 9))
//      path.closeSubpath()
      
      // right ribbon
      path.move(to: CGPoint(x: rect.width * 5.0 / 6, y: rect.height * 1.0 / 3))
      path.addLine(to: CGPoint(x: rect.width * 4.5 / 6, y: rect.height * 2.0 / 9))
      path.addLine(to: CGPoint(x: rect.width * 4.5 / 6, y: rect.height * 7.0 / 18))
      
      path.move(to: CGPoint(x: rect.width * 4.5 / 6, y: rect.height * 2.0 / 9))
      path.addLine(to: CGPoint(x: rect.width * 17.0 / 18, y: rect.height * 1.0 / 6))
      path.addLine(to: CGPoint(x: rect.width * 11.0 / 12, y: rect.height * 3.0 / 9))
      path.addLine(to: CGPoint(x: rect.width * 1, y: rect.height * 4.0 / 9))
      path.addLine(to: CGPoint(x: rect.width * 10.6 / 12, y: rect.height * 5.0 / 9))
//      path.closeSubpath()
    }
  }
  
}

struct DiamondBanner_Previews: PreviewProvider {
    static var previews: some View {
        RibbonBanner()
          .stroke()
          .frame(width: 200, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}
