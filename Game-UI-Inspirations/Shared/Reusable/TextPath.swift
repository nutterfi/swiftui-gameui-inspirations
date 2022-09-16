//
//  TextPath.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 2/1/22.
//

import SwiftUI
import Shapes

struct TextPath<S: Shape>: View {
  public var text: String
  public var size: CGFloat
  public var shape: S
  
  public init(text: String, shape: S, size: CGFloat = 24) {
    self.text = text
    self.size = size
    self.shape = shape
  }
  
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        let rect = proxy.frame(in: .local)
        ZStack {
          let path = shape.path(in: rect)
          let points = path.equallySpacedPoints(count: text.count)
          
          ForEach(0..<points.count, id:\.self) { index in
            let vertex = points[index]
            let i = text.utf16.index(text.utf16.startIndex, offsetBy: index)
            let character = text[i]
            
            Text(String(character))
              .font(.system(size: size))
              .offset(x: dim * -0.5 + vertex.x, y: rect.height * -0.5 + vertex.y)
          }
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct TextPath_Previews: PreviewProvider {
    static var previews: some View {
      TextPath(text: "Hello Chat! This is a test string. Can you see a star shape of text?", shape: StarPolygon(points: 5, density: 1))
    }
}
