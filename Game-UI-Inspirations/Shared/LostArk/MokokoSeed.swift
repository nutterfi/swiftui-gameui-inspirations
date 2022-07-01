//
//  MokokoSeed.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 6/30/22.
//

import SwiftUI

struct MokokoSeed: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      
      // Leaf 1
      var p = Path()
      p.move(to: CGPoint(x: rect.midX, y: rect.minY + rect.height * 0.4))
      p.addQuadCurve(
        to: CGPoint(x: rect.maxX - 0.1 * rect.width, y: rect.minY + 0.1 * rect.height),
        control: CGPoint(x: rect.midX, y: rect.minY)
      )
      p.addCurve(
        to: CGPoint(x: rect.minX + 0.51 * rect.width, y: rect.minY + rect.height * 0.4),
        control1: CGPoint(x: rect.minX + 0.6 * rect.width, y: rect.minY + rect.height * 0.36),
        control2: CGPoint(x: rect.minX + 0.54 * rect.width, y: rect.minY + rect.height * 0.3))
      
      
      p.closeSubpath()
      path.addPath(p)
      
      // Leaf 2
      p = Path()
      p.move(to: CGPoint(x: rect.midX, y: rect.minY + rect.height * 0.37))
      p.addQuadCurve(
        to: CGPoint(x: rect.minX + 0.15 * rect.width, y: rect.minY + 0.3 * rect.height),
        control: CGPoint(x: rect.minX + 0.4 * rect.width, y: rect.minY + rect.height * 0.1)
      )
      
      p.addCurve(
        to: CGPoint(x: rect.midX, y: rect.minY + rect.height * 0.37),
        control1: CGPoint(x: rect.minX + 0.3 * rect.width, y: rect.minY + rect.height * 0.36),
        control2: CGPoint(x: rect.minX + 0.4 * rect.width, y: rect.minY + rect.height * 0.29))
      
      path.addPath(p)
      
      // Seed
      p = Path()
      p.move(to: CGPoint(x: rect.midX - 0.05 * rect.width, y: rect.minY + rect.height * 0.42))
      p.addQuadCurve(
        to: CGPoint(x: p.currentPoint!.x + 0.1 * rect.width, y: p.currentPoint!.y),
        control: CGPoint(x: rect.midX, y: rect.minY + rect.height * 0.34)
      )
      
      p.addQuadCurve(
        to: CGPoint(x: p.currentPoint!.x - 0.3 * rect.width, y: p.currentPoint!.y + 0.5 * rect.height),
        control: CGPoint(x: rect.minY + 0.6 * rect.width, y: rect.maxY -  rect.height * 0.1)
      )
      
      p.addQuadCurve(
        to: CGPoint(x: p.currentPoint!.x - 0.1 * rect.width, y: p.currentPoint!.y - 0.3 * rect.height),
        control: CGPoint(x: rect.minY, y: rect.maxY -  rect.height * 0.14)
      )
      
      p.addQuadCurve(
        to: CGPoint(x: p.currentPoint!.x + 0.18 * rect.width, y: p.currentPoint!.y - 0.07 * rect.height),
        control: CGPoint(x: rect.minY + 0.18 * rect.width, y: rect.maxY -  rect.height * 0.45)
      )
      
      p.closeSubpath()
      
      path.addPath(p)

    }
  }
}

struct MokokoSeed_Previews: PreviewProvider {
    static var previews: some View {
        MokokoSeed()
        .frame(width: 512, height: 512)
        .border(Color.black)
        .foregroundStyle(
          LinearGradient(colors: [Color.mokokoLeafYellow, Color.mokokoBelly], startPoint: .topTrailing, endPoint: .bottomLeading)
        )
    }
}
//78 74 11 belly of the mokoko
//
extension Color {
  static var mokokoYellow: Color {
    Color(red: 236/255, green: 229/255, blue: 149/255)
  }
  
  static var mokokoBelly: Color {
    Color(red: 78/255, green: 74/255, blue: 11/255)
  }
  
  static var mokokoLeafGreen: Color {
    Color(red: 59/255, green: 131/255, blue: 25/255)
  }
  
  static var mokokoLeafYellow: Color {
    Color(red: 225/255, green: 237/255, blue: 73/255)
  }
  
}
