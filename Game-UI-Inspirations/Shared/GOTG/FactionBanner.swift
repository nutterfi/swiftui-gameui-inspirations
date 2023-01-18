//
//  FactionBanner.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 1/17/23.
//

import SwiftUI
import Shapes

struct Banner: Shape {
  var corner: CGPoint = CGPoint(x: 0.9, y: 0.5)
  
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.move(to: .zero)
      path.addLine(to: .init(x: rect.maxX, y: rect.minY))
      path.addLine(to: .init(x: corner.x * rect.width, y: rect.height * corner.y))
      path.addLine(to: .init(x: rect.maxX, y: rect.maxY))
      path.addLine(to: .init(x: rect.minX, y: rect.maxY))
      path.closeSubpath()
    }
  }
}

struct FactionBanner: View {
  var body: some View {
    ZStack {
      KreeSymbol()
        .rotationEffect(.radians(.pi))
        .scaleEffect(x: -2, y: 2)
        .offset(y: 20)
      
      LinearGradient(colors: [.purple, .purple.opacity(0.5), .blue], startPoint: .leading, endPoint: .trailing)
      
      Rectangle()
        .fill(ImagePaint(image: Image(systemName: "triangle")))
        .opacity(0.1)
      
      HStack {
        KreeSymbol()
          .frame(width: 90)
          .offset(x: 10, y: -10)
        Spacer()
        Text("ABCDEF")
          .font(.title2)
          .kerning(18)
          .monospaced()
          .foregroundColor(.white)
          .padding(.horizontal, 22)
      }
      
      RightTriangle()
        .foregroundColor(.black.opacity(0.2))
        

    }
    .clipShape(
      Banner(corner: .init(x: 0.92, y: 0.5))
    )
    .overlay(
      Banner(corner: .init(x: 0.92, y: 0.5))
        .stroke(lineWidth: 3)
    )
  }
}

struct FactionBanner_Previews: PreviewProvider {
  static var previews: some View {
    FactionBanner()
      .frame(width: 400, height: 100)
  }
}
