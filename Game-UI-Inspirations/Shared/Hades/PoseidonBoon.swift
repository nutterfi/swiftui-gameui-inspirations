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
      path.move(to: CGPoint(x: 0.5 * rect.width, y: 0))
      path.addLine(to: CGPoint(x: 0.55 * rect.width, y: 0.2 * rect.height))
      path.addLine(to: CGPoint(x: 0.52 * rect.width, y: 0.22 * rect.height))
      path.addLine(to: CGPoint(x: 0.52 * rect.width, y: 0.5 * rect.height))
      path.addLine(to: CGPoint(x: 0.55 * rect.width, y: 0.52 * rect.height))
      path.addLine(to: CGPoint(x: 0.65 * rect.width, y: 0.5 * rect.height))
      path.addLine(to: CGPoint(x: 0.65 * rect.width, y: 0.3 * rect.height))
      path.addLine(to: CGPoint(x: 0.7 * rect.width, y: 0.35 * rect.height))
      path.addLine(to: CGPoint(x: 0.68 * rect.width, y: 0.36 * rect.height))
      path.addLine(to: CGPoint(x: 0.75 * rect.width, y: 0.5 * rect.height))
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
