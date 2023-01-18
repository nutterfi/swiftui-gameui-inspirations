//
//  KrakoaFont.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 1/17/23.
//

import SwiftUI

struct KrakoaFont: Shape {
  var letter: Character
  // based on width
  let circleSize = 1.0
  let squareSize = 1.0/3.0
  
  func A(rect: CGRect) -> Path {
    Path { path in
      path.move(to: .zero)
      path.addRect(
        CGRect(
          origin: .zero,
          size: .init(width: rect.width * squareSize, height: rect.width * squareSize)
        )
      )
      path.addRect(
        CGRect(
          origin: .init(x: rect.width * 2/3, y: .zero),
          size: .init(width: rect.width * squareSize, height: rect.width * squareSize)
        )
      )
      path.addRect(
        CGRect(
          origin: .init(x: rect.width * 1/3, y: rect.height * 4/5),
          size: .init(width: rect.width * squareSize, height: rect.width * squareSize)
        )
      )
      path.addEllipse(in: .init(
        origin: .init(x: .zero, y: rect.height * 1/5),
        size: .init(width: rect.width * circleSize, height: rect.width * circleSize))
      )
    }
  }
  
  func path(in rect: CGRect) -> Path {
    switch letter.lowercased() {
    case "a":
      return A(rect: rect)
    default:
      return Path()
    }
  }
    
}

struct KrakoaFont_Previews: PreviewProvider {
    static var previews: some View {
        KrakoaFont(letter: "A")
        .stroke()
        .frame(width: 30, height:50)
    }
}
