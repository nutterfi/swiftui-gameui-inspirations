//
//  ElevationMap.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 9/23/21.
//

import SwiftUI

struct ElevationMap: View {
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          ForEach(0..<5, id: \.self) { index in
            Ellipse()
              .inset(by: CGFloat(index) * dim * 0.1 * CGFloat.random(in: 0.5...1))
              .stroke(lineWidth: dim * 0.01)
          }
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct ElevationMap_Previews: PreviewProvider {
    static var previews: some View {
        ElevationMap()
      .frame(width: 326, height: 256)
    }
}
