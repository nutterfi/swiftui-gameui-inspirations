//
//  ArtemisBoon.swift
//  ArtemisBoon
//
//  Created by nutterfi on 7/22/21.
//

import SwiftUI

struct ArtemisBoon: Shape {
  
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.move(to: CGPoint(x: 0.5 * rect.width, y: rect.height * 0.05))
      path.addLine(to: CGPoint(x: 0.6 * rect.width, y: rect.height * 0.25)) //
      path.addLine(to: CGPoint(x: 0.51 * rect.width, y: rect.height * 0.2))
      path.addLine(to: CGPoint(x: 0.51 * rect.width, y: rect.height * 0.18))
      path.addLine(to: CGPoint(x: 0.51 * rect.width, y: rect.height * 0.7))
      path.addLine(to: CGPoint(x: 0.54 * rect.width, y: rect.height * 0.72))
      
      path.addLine(to: CGPoint(x: 0.51 * rect.width, y: rect.height * 0.7))
      
      path.addLine(to: CGPoint(x: 0.6 * rect.width, y: rect.height * 0.8))
      
      // bottom right of arrow shaft
      path.addLine(to: CGPoint(x: 0.55 * rect.width, y: rect.height * 0.9))
      
      path.addLine(to: CGPoint(x: 0.53 * rect.width, y: rect.height * 0.8))
      
      path.addLine(to: CGPoint(x: 0.47 * rect.width, y: rect.height * 0.8))
      
      // bottom left shaft
      path.addLine(to: CGPoint(x: 0.45 * rect.width, y: rect.height * 0.9))
      
      path.addLine(to: CGPoint(x: 0.4 * rect.width, y: rect.height * 0.8))

      path.addLine(to: CGPoint(x: 0.49 * rect.width, y: rect.height * 0.7))
      
      path.addLine(to: CGPoint(x: 0.46 * rect.width, y: rect.height * 0.72))
      
      path.addLine(to: CGPoint(x: 0.49 * rect.width, y: rect.height * 0.7))
      
      path.addLine(to: CGPoint(x: 0.49 * rect.width, y: rect.height * 0.18))
      
      path.addLine(to: CGPoint(x: 0.49 * rect.width, y: rect.height * 0.2))
      
      path.addLine(to: CGPoint(x: 0.4 * rect.width, y: rect.height * 0.25))
      
      path.closeSubpath()
      
      // Left bar
      path.move(to: CGPoint(x: rect.width * 0.1, y: rect.height * 0.48))
      path.addLine(to: CGPoint(x: 0.45 * rect.width, y: rect.height * 0.48))
      
      path.addLine(to: CGPoint(x: 0.46 * rect.width, y: rect.height * 0.5))
      
      path.addLine(to: CGPoint(x: 0.45 * rect.width, y: rect.height * 0.52))
      
      path.addLine(to: CGPoint(x: 0.13 * rect.width, y: rect.height * 0.52))
      path.closeSubpath()
      
      // Right bar
      path.move(to: CGPoint(x: rect.width * 0.9, y: rect.height * 0.48))
      path.addLine(to: CGPoint(x: 0.55 * rect.width, y: rect.height * 0.48))
      
      path.addLine(to: CGPoint(x: 0.54 * rect.width, y: rect.height * 0.5))
      
      path.addLine(to: CGPoint(x: 0.55 * rect.width, y: rect.height * 0.52))
      
      path.addLine(to: CGPoint(x: 0.87 * rect.width, y: rect.height * 0.52))
      path.closeSubpath()
      
    }
  }
  
   
}

struct ArtemisBoon_Previews: PreviewProvider {
    static var previews: some View {
        ArtemisBoon()
        .fill(Color.green)
        .border(Color.black)
        .frame(width: 256, height: 256)
    }
}
