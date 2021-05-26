//
//  DiamondGem.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/25/21.
//

import SwiftUI

struct DiamondGem: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      // perimeter
      path.move(to: CGPoint(x: rect.width * 0.5, y: rect.height))
      path.addLine(to: CGPoint(x: 0, y: rect.height * 0.25))
      path.addLine(to: CGPoint(x: rect.width * 0.25, y: 0))
      path.addLine(to: CGPoint(x: rect.width * 0.75, y: 0))
      path.addLine(to: CGPoint(x: rect.width, y: rect.height * 0.25))
      path.closeSubpath()
      
      // interior edges
      path.move(to: CGPoint(x: 0, y: rect.height * 0.25))
      path.addLine(to: CGPoint(x: rect.width, y: rect.height * 0.25))
      
      path.move(to: CGPoint(x: rect.width * 0.5, y: rect.height))
      path.addLine(to: CGPoint(x: rect.width * 0.25, y: rect.height * 0.25))
      path.addLine(to: CGPoint(x: rect.width * 0.375, y: 0))
      
      path.move(to: CGPoint(x: rect.width * 0.5, y: rect.height))
      path.addLine(to: CGPoint(x: rect.width * 0.75, y: rect.height * 0.25))
      path.addLine(to: CGPoint(x: rect.width * 0.625, y: 0))
      
      path.move(to: CGPoint(x: rect.width * 0.5, y: rect.height))
      path.addLine(to: CGPoint(x: rect.width * 0.5, y: 0))
      
    }
  }
  
}

struct DiamondGem_Previews: PreviewProvider {
    static var previews: some View {
        DiamondGem()
          .stroke()
    }
}
