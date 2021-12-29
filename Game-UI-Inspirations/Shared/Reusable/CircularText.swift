//
//  CircularText.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 12/28/21.
//

import SwiftUI
import Shapes

public struct CircularText: View {
  public var text: String
  public var size: CGFloat
  
  public init(text: String, size: CGFloat = 24) {
    self.text = text
    self.size = size
  }
  public var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      let n = text.count
      let rect = proxy.frame(in: .local)
      let vertices = ConvexPolygon(
        sides: n)
        .vertices(in: rect)
      
      ZStack {
        ForEach(0..<n) { index in
          let vertex = vertices[index]
          let i = text.utf16.index(text.utf16.startIndex, offsetBy: index)
          let character = text[i]
          
          let angle = atan2((vertex.y - rect.midY), (vertex.x - rect.midX))
          
          // rotate->offset
          Text(String(character))
            .font(.system(size: size))
            .rotationEffect(.radians(angle + CGFloat.pi / 2))
            .offset(x: -dim * 0.5 + vertex.x, y: -dim * 0.5 + vertex.y)
        }
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}


struct CircularTextView_Previews: PreviewProvider {
    static var previews: some View {
      CircularText(text: "HELLO WORLD!")
      .frame(width: 256, height: 256)
      .foregroundColor(Color.purple)
    }
}
