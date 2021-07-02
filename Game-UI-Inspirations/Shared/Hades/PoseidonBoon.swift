//
//  PoseidonBoon.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/1/21.
//

import SwiftUI

struct PoseidonBoon: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      // top edge
      path.move(to: CGPoint(x: 0.5 * rect.width, y: 0))
      
      path.addLine(to: CGPoint(x: 0.55 * rect.width, y: 0.2 * rect.height))
      path.addLine(to: CGPoint(x: 0.52 * rect.width, y: 0.22 * rect.height))
      path.addLine(to: CGPoint(x: 0.52 * rect.width, y: 0.5 * rect.height))
      path.addLine(to: CGPoint(x: 0.55 * rect.width, y: 0.52 * rect.height))
      path.addLine(to: CGPoint(x: 0.65 * rect.width, y: 0.5 * rect.height))
      path.addLine(to: CGPoint(x: 0.65 * rect.width, y: 0.3 * rect.height))
      path.addLine(to: CGPoint(x: 0.7 * rect.width, y: 0.35 * rect.height))
      path.addLine(to: CGPoint(x: 0.68 * rect.width, y: 0.36 * rect.height))
      path.addLine(to: CGPoint(x: 0.73 * rect.width, y: 0.5 * rect.height))
      path.addLine(to: CGPoint(x: 0.75 * rect.width, y: 0.52 * rect.height))
      path.addLine(to: CGPoint(x: 0.73 * rect.width, y: 0.56 * rect.height))
      path.addLine(to: CGPoint(x: 0.70 * rect.width, y: 0.57 * rect.height))
      path.addLine(to: CGPoint(x: 0.54 * rect.width, y: 0.64 * rect.height))
      path.addLine(to: CGPoint(x: 0.53 * rect.width, y: 0.66 * rect.height))
      path.addLine(to: CGPoint(x: 0.53 * rect.width, y: 0.9 * rect.height))
      // bottom
      path.addLine(to: CGPoint(x: 0.5 * rect.width, y: 0.95 * rect.height))
      // now mirror
      path.addLine(to: CGPoint(x: 0.47 * rect.width, y: 0.9 * rect.height))
      
      path.addLine(to: CGPoint(x: 0.47 * rect.width, y: 0.66 * rect.height))
      path.addLine(to: CGPoint(x: 0.46 * rect.width, y: 0.64 * rect.height))
      path.addLine(to: CGPoint(x: 0.30 * rect.width, y: 0.57 * rect.height))
      path.addLine(to: CGPoint(x: 0.27 * rect.width, y: 0.56 * rect.height))
      path.addLine(to: CGPoint(x: 0.25 * rect.width, y: 0.52 * rect.height))
      path.addLine(to: CGPoint(x: 0.27 * rect.width, y: 0.5 * rect.height))
      path.addLine(to: CGPoint(x: 0.32 * rect.width, y: 0.36 * rect.height))
      path.addLine(to: CGPoint(x: 0.3 * rect.width, y: 0.35 * rect.height))
      path.addLine(to: CGPoint(x: 0.35 * rect.width, y: 0.3 * rect.height))
      path.addLine(to: CGPoint(x: 0.35 * rect.width, y: 0.5 * rect.height))
      path.addLine(to: CGPoint(x: 0.45 * rect.width, y: 0.52 * rect.height))
      path.addLine(to: CGPoint(x: 0.48 * rect.width, y: 0.5 * rect.height))
      path.addLine(to: CGPoint(x: 0.48 * rect.width, y: 0.22 * rect.height))
      path.addLine(to: CGPoint(x: 0.45 * rect.width, y: 0.2 * rect.height))
      
      path.closeSubpath()
    }
  }
  
   
}

struct PoseidonBoon_Previews: PreviewProvider {
    static var previews: some View {
        PoseidonBoon()
          .stroke()
          .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}
