//
//  OverwatchIcon.swift
//  Game-UI-Inspirations (iOS)
//
//  Created by nutterfi on 6/29/21.
//

import SwiftUI

struct OverwatchW: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.move(to: CGPoint(x: rect.width * 0.48, y: rect.height * 0.3))
      path.addLine(to: CGPoint(x: rect.width * 0.48, y: rect.height * 0.6))
      
      // wedge shape
      path.addLine(to: CGPoint(x: rect.width * 0.2, y: rect.height * 0.9))
      path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                  radius: rect.width * 0.5,
                  startAngle: .init(degrees: 125),
                  endAngle: .init(degrees: 140),
                  clockwise: false)
      path.addLine(to: CGPoint(x: rect.width * 0.4, y: rect.height * 0.5))
      path.closeSubpath()
    }
  }
  
}

struct OverwatchIcon<T: ShapeStyle, U: ShapeStyle>: View {
  var primary: T
  var secondary: U
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        OverwatchW()
          .fill(primary)
          .frame(width: dim, height: dim)

        OverwatchW()
          .fill(primary)
          .scaleEffect(x: -1)
          .frame(width: dim, height: dim)
        
        Circle()
          .trim(from: 0, to: 0.75)
          .rotation(.init(degrees: -45))
          .stroke(primary, lineWidth: dim * 0.15)
          .frame(width: dim * 0.85, height: dim * 0.85)

        Circle()
          .trim(from: 0.76, to: 0.99)
          .rotation(.init(degrees: -45))
          .stroke(secondary, lineWidth: dim * 0.15)
          .frame(width: dim * 0.85, height: dim * 0.85)
        
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct OverwatchIcon_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.black.ignoresSafeArea()
      OverwatchIcon(primary: Color.purple, secondary: Color.brown)
        .frame(width: 256, height: 256)
        .border(Color.white)
    }
  }
}
