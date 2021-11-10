//
//  MK11.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 4/23/21.
//

import SwiftUI

// This draws the number 11

// Left "1" of the 11
struct MK11Left: Shape {
  func path(in rect: CGRect) -> Path {

    let left1TopRightCorner = CGPoint(x: rect.width, y: 0)
    let left1BottomRightCorner = CGPoint(x: rect.width, y: rect.height)
    let left1BottomLeftCorner = CGPoint(x: rect.width * 0.3, y: rect.height * 0.8)
    let left1TopInnerCorner = CGPoint(x: rect.width * 0.3, y: rect.height * 0.25)
    let left1TopLeftCorner = CGPoint(x: 0, y: rect.height * 0.25)

    return Path { path in
      path.move(to: left1TopRightCorner)
      path.addLine(to: left1BottomRightCorner)
      path.addLine(to: left1BottomLeftCorner)
      path.addLine(to: left1TopInnerCorner)
      path.addLine(to: left1TopLeftCorner)
      path.closeSubpath()
    }
  }

}

// Right "1" of the 11
struct MK11Right: Shape {
  func path(in rect: CGRect) -> Path {
    let right1TopRightCorner = CGPoint(x: rect.width, y: 0)
    let right1BottomRightCorner = CGPoint(x: rect.width, y: rect.height * 0.8)
    let right1BottomLeftCorner = CGPoint(x: rect.width * 0.3, y: rect.height)
    let right1TopInnerCorner = CGPoint(x: rect.width * 0.3, y: rect.height * 0.25)
    let right1TopLeftCorner = CGPoint(x: 0, y: rect.height * 0.25)
    
    return Path { path in
      path.move(to: right1TopRightCorner)
      path.addLine(to: right1BottomRightCorner)
      path.addLine(to: right1BottomLeftCorner)
      path.addLine(to: right1TopInnerCorner)
      path.addLine(to: right1TopLeftCorner)
      path.closeSubpath()
    }
  }

}

struct MK11_Previews: PreviewProvider {
    static var previews: some View {
      HStack(spacing: 10) {
        MK11Left()
          .fill(LinearGradient(colors: [.red, .black], startPoint: .top, endPoint: .bottom))
            .frame(width: 60)
        
        MK11Right()
          .fill(LinearGradient(colors: [.red, .black], startPoint: .top, endPoint: .bottom))
            .frame(width: 60)
      }
      .frame(height: 200)
    }
}
