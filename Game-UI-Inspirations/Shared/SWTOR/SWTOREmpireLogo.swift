//
//  SWTOREmpireLogo.swift
//  SWTOREmpireLogo
//
//  Created by nutterfi on 8/10/21.
//

import SwiftUI
import Shapes

struct SWTOREmpireLogo: View {
  var color: Color
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
            StrokeStyledPolygon(sides: 6, dashes: 6, dashFillRatio: 0.7, lineWidthRatio: dim * 0.8 * 0.0001, dashPhaseRatio: 0.36, lineCap: .square)
              .foregroundStyle(color)
              .frame(width: dim, height: dim)
              .rotationEffect(.degrees(90))
            
            StrokeStyledCircle(numberOfSegments: 6, segmentRatio: 0.25, scale: 1, lineWidthRatio: 1, dashPhaseRatio: 0.63)
              .foregroundStyle(color)
              .frame(width: dim, height: dim)
              .mask(
                Polygon(sides: 6)
                  .rotationEffect(.degrees(90))
              )
            
            Polygon(sides: 6)
              .foregroundStyle(color)
              .rotationEffect(.degrees(90))
              .frame(width: dim * 0.5)
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct SWTOREmpireLogo_Previews: PreviewProvider {
    static var previews: some View {
      SWTOREmpireLogo(color: .purple)
        .frame(width: 256, height: 256)
        .padding()
        .border(Color.purple)
    }
}
