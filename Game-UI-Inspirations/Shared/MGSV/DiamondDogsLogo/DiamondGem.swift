//
//  DiamondGem.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/25/21.
//

import SwiftUI

struct DiamondGem: Shape {
  
  func innerPath(in rect: CGRect) -> Path {
    Path { path in
      // perimeter
      path.move(to: CGPoint(x: rect.midX, y: rect.height))
      path.addLine(to: CGPoint(x: rect.minX, y: rect.height * 0.25))
      path.addLine(to: CGPoint(x: rect.minX + rect.width * 0.25, y: rect.minY))
      path.addLine(to: CGPoint(x: rect.minX + rect.width * 0.75, y: rect.minY))
      path.addLine(to: CGPoint(x: rect.maxX, y: rect.height * 0.25))
      path.closeSubpath()
    }
  }
  
  func path(in rect: CGRect) -> Path {
    Path { path in
      
      path.addPath(innerPath(in: rect))
      let newRect = rect.insetBy(dx: rect.width * 0.25, dy: 0)
      path.addPath(innerPath(in: newRect))
      
      
      // interior lines
      // horizontal
      path.move(to: CGPoint(x: 0, y: rect.height * 0.25))
      path.addLine(to: CGPoint(x: rect.width, y: rect.height * 0.25))
      // vertical
      path.move(to: CGPoint(x: rect.width * 0.5, y: rect.height))
      path.addLine(to: CGPoint(x: rect.width * 0.5, y: 0))
    }
  }
  
}

struct DiamondGem_Previews: PreviewProvider {
    static var previews: some View {
        DiamondGem()
          .stroke()
          .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}
