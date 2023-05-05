//
//  SaberHilt.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/4/23.
//

import SwiftUI

struct SaberHilt: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.move(to: CGPoint(x: rect.minX + 0.25 * rect.width, y: rect.maxY))
      
      // LEFT part of hilt
      path.addLine(to: .init(x: path.currentPoint!.x, y: rect.height * 0.5))
      path.addLine(to: .init(x: path.currentPoint!.x + 0.15 * rect.width, y: rect.height * 0.65))
      path.addLine(to: .init(x: path.currentPoint!.x, y: rect.maxY))
      path.addLine(to: .init(x: path.currentPoint!.x + 0.12 * rect.width, y: rect.maxY))
      path.addLine(to: .init(x: path.currentPoint!.x, y: rect.height * 0.5))
      path.addLine(to: .init(x: path.currentPoint!.x + 0.11 * rect.width, y: rect.height * 0.55))
      path.addLine(to: .init(x: path.currentPoint!.x, y: rect.maxY))

      path.closeSubpath()
    }
  }
  
}


struct SaberHilt_Previews: PreviewProvider {
    static var previews: some View {
        SaberHilt()
    }
}
