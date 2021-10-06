//
//  OrnateCorners.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 10/3/21.
//

import SwiftUI
import Shapes

struct OrnateCorners: View {
    var body: some View {
      GeometryReader { proxy in
        let sides = 4
        let dim = min(proxy.size.width, proxy.size.height)
        let vertices = IsoscelesTriangle()
          .vertices(in: CGRect(x: 0, y: 0, width: dim, height: dim))
          
        
        ZStack {

          ForEach(0..<vertices.count, id: \.self) { index in
            let vertex = vertices[index]
            Spirolateral(turns: [3], turningAngle: 108, repetitions: 15, reversedIndexes: [2, 7, 8])
              .stroke()
              .frame(width: dim / 5, height: dim / 5)
              .offset(x: -dim * 0.5 + vertex.x, y: -dim * 0.5 + vertex.y)
          }
          
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct OrnateCorners_Previews: PreviewProvider {
    static var previews: some View {
        OrnateCorners()
        .padding(50)
    }
}
