//
//  StrokeStylePolygon.swift
//  StrokeStylePolygon
//
//  Created by nutterfi on 8/3/21.
//

import SwiftUI
import Shapes

/// NB: This works better with lots of dashes
struct StrokeStyledRectangle: View {
  var dashes: Int = 4
  var dashFillRatio: CGFloat = 0.1
  var lineWidthRatio: CGFloat = 0.01
  var dashPhaseRatio: CGFloat = 0.36
  var lineCap: CGLineCap = .round
  var lineJoin: CGLineJoin = .miter
  var trim: (CGFloat, CGFloat) = (0, 1)
  
  var body: some View {
    
    GeometryReader { proxy in
      let normalLineWidthRatio = lineWidthRatio.clamped(to: 0...CGFloat(0.5))
      let dim = min(proxy.size.width, proxy.size.height)
      let perimeter = 2 * (proxy.size.width + proxy.size.height) * (1 - normalLineWidthRatio)
      let strokeRatio: CGFloat =
      dashes > 0 ? perimeter / CGFloat(dashes) : 0
      ZStack {
        Rectangle()
          .inset(by: dim * normalLineWidthRatio * 0.5)
          .trim(from: trim.0, to: trim.1)
          .stroke(
            style: StrokeStyle(
              lineWidth: dim * normalLineWidthRatio,
              lineCap: lineCap,
              lineJoin: lineJoin,
              dash: [strokeRatio * dashFillRatio, strokeRatio * (1.0 - dashFillRatio)],
              dashPhase: strokeRatio * dashPhaseRatio
            )
          )
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct StrokeStyledRectangle_Previews: PreviewProvider {
  static var previews: some View {
    StrokeStyledRectangle()
      .frame(width: 256, height: 256)
      .previewLayout(.sizeThatFits)
  }
}
