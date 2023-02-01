//
//  FactionBanner.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 1/17/23.
//

import SwiftUI
import Shapes

extension Color {
  static let kreeBlue = Color(red: 34/255, green: 45/255, blue: 77/255)
  
  static let gotgDark = Color(red: 38/255, green: 3/255, blue: 23/255)
  
  static let gotgBorder = Color(red: 158/255, green: 88/255, blue: 125/255)
  

}

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
      LinearGradient(colors: [.purple, .purple.opacity(0.5), .kreeBlue], startPoint: .leading, endPoint: .trailing)
      
      KreeSymbol()
        .rotationEffect(.radians(.pi))
        .scaleEffect(x: -3, y: 3)
        .offset(x: 10, y: 40)
        .opacity(0.5)
      
      Rectangle()
        .fill(ImagePaint(image: Image(systemName: "triangle")))
        .opacity(0.1)
      
      HStack {
        KreeSymbol()
          .frame(width: 90)
          .offset(x: 10, y: -10)
        Spacer()
        Text("AFCChDE")
          .font(.title2)
          .kerning(17)
          .monospaced()
          .foregroundColor(.white)
          .padding(.horizontal, 16)
      }
      
      RightTriangle()
        .foregroundColor(.black.opacity(0.5))
        

    }
    .clipShape(
      Banner(corner: .init(x: 0.94, y: 0.5))
    )
    .overlay(
      Banner(corner: .init(x: 0.94, y: 0.5))
        .stroke(Color.gotgBorder, lineWidth: 1)
    )
  }
}

struct FactionBanner_Previews: PreviewProvider {
  static var previews: some View {
    FactionBanner()
      .frame(width: 400, height: 100)
      .background(Color.gotgDark)
      .previewLayout(.sizeThatFits)
  }
}
