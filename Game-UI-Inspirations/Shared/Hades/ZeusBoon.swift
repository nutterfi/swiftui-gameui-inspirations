//
//  ZeusBoon.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/1/21.
//

import SwiftUI

struct ZeusBoon: Shape {
  // normalized
  private var topRight: CGPoint { CGPoint(x: 0.7, y: 0.15) }
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.move(to: CGPoint(x: topRight.x * rect.width, y: topRight.y * rect.height))
      
      path.addLine(to: CGPoint(x: rect.width * 0.52, y: rect.height * 0.45))
      path.addLine(to: CGPoint(x: rect.width * 0.65, y: rect.height * 0.45))
      
      // bottom right
      path.addLine(to: CGPoint(x: rect.width * 0.55, y: rect.height * 0.8))
      
      // bottom left
      path.addLine(to: CGPoint(x: rect.width * 0.45, y: rect.height * 0.85))
      path.addLine(to: CGPoint(x: rect.width * 0.5, y: rect.height * 0.6))
      
      path.addLine(to: CGPoint(x: rect.width * 0.25, y: rect.height * 0.62))
      
      path.addLine(to: CGPoint(x: rect.width * 0.32, y: rect.height * 0.38))
    
      path.addLine(to: CGPoint(x: rect.width * 0.2, y: rect.height * 0.4))
   
      // top left
      path.addLine(to: CGPoint(x: rect.width * 0.25, y: rect.height * 0.1))
      path.closeSubpath()
      
    }
  }
}

struct ZeusBoon_Previews: PreviewProvider {
    static var previews: some View {
        ZeusBoon()
          .fill(Color.orange)
          .frame(width: 100, height: 100)
          .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
    }
}
