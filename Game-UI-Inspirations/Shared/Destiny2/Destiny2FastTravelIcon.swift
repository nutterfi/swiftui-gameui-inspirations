//
//  Destiny2FastTravelIcon.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 9/23/21.
//

import SwiftUI
import Shapes

struct Destiny2FastTravelIcon: View {
  var color: Color = .black
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          StarPolygon(points: 16, density: 3)
            .stroke(color)
          
          Circle()
            .inset(by: dim * 0.08)
            .strokeBorder(color, lineWidth: 10)
          
          StrokeStyledCircle(numberOfSegments: 72, segmentRatio: 0.25, lineWidthRatio: 0.01)
            .frame(width: dim * 0.75, height: dim * 0.75)
            .foregroundColor(color)
          
          VStack(spacing:0) {
            IsoscelesTriangle()
              .strokeBorder(color, lineWidth: 10)
              .frame(width: dim * 0.3, height: dim * 0.15)
              .rotationEffect(.degrees(180))
            
            IsoscelesTriangle()
              .foregroundColor(color)
              .frame(width: dim * 0.6, height: dim * 0.25)
              .rotationEffect(.degrees(180))
          }
          .offset(x: 0, y: dim * 0.05)
          
          Group {
            Circle().frame(width: dim * 0.05)
              .offset(x: -dim * 0.4, y: -dim * 0.4)
            Circle().frame(width: dim * 0.05)
              .offset(x: -dim * 0.4, y: dim * 0.4)
            Circle().frame(width: dim * 0.05)
              .offset(x: dim * 0.4, y: -dim * 0.4)
            Circle().frame(width: dim * 0.05)
              .offset(x: dim * 0.4, y: dim * 0.4)
          }
          .foregroundColor(color)
          
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct Destiny2FastTravelIcon_Previews: PreviewProvider {
    static var previews: some View {
        Destiny2FastTravelIcon()
//      .frame(width: 256, height: 256)
    }
}
