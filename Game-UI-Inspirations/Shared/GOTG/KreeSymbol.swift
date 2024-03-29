//
//  KreeSymbol.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 1/17/23.
//

import SwiftUI
import Shapes

struct KreeSymbol: View {
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        Group {
          ConvexPolygon(sides: 3)
            .strokeBordered(15/256 * dim)
            .rotation(.radians(.pi))
            .offset(x: 0, y: -dim * 0.1)
          
          ConvexPolygon(sides: 3)
            .inset(by: 50/256 * dim)
            .rotation(.radians(.pi))
            .strokeBordered(8/256 * dim)
            .offset(x: 0, y: -dim * 0.1)
          
          IsotoxalPolygon(sidePairs: 3, innerRadius: 0)
            .inset(by: 75/256 * dim)
            .rotation(.radians(-.pi/2))
            .strokeBordered(8/256 * dim)
            .offset(x: 0, y: -dim * 0.1)
          
          StrokeStyledPolygon(
            sides: 3,
            dashPatternCount: 3,
            dashPattern: [2, 1],
            lineWidthRatio: 0.08/256 * dim,
            dashPhaseRatio: -0.33
          )
          .inset(by: 85/256 * dim)
          .offset(x: 0, y: -dim * 0.1)
    
          StrokeStyledPolygon(
            sides: 3,
            dashPatternCount: 3,
            dashPattern: [2, 3],
            lineWidthRatio: 0.08/256 * dim,
            dashPhaseRatio: -0.33
          )
          .inset(by: 50/256 * dim)
          .offset(x: 0, y: -dim * 0.1)
        }

      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct KreeSymbol_Previews: PreviewProvider {
  static var previews: some View {
    KreeSymbol()
      .frame(width: 256, height: 256)
      .border(Color.red)
  }
}
