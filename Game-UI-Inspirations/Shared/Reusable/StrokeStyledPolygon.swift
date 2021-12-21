//
//  StrokeStylePolygon.swift
//  StrokeStylePolygon
//
//  Created by nutterfi on 8/3/21.
//

import SwiftUI
import Shapes

struct StrokeStyledPolygon: View {
  var sides: Int = 6
  var dashes: Int = 6
  var density: Int = 1
  var dashFillRatio: CGFloat = 0.7
  var lineWidthRatio: CGFloat = 0.01
  var dashPhaseRatio: CGFloat = 0.36
  var lineCap: CGLineCap = .round
  var lineJoin: CGLineJoin = .miter
  var trim: (CGFloat, CGFloat) = (0, 1)
  
  var body: some View {
    GeometryReader { proxy in
      let normalLineWidthRatio = lineWidthRatio.clamped(to: 0...CGFloat(0.5))
      let dim = min(proxy.size.width, proxy.size.height)
      let perimeter = CGFloat(sides) * dim * (1 - normalLineWidthRatio) * sin(.pi / CGFloat(sides))
      let strokeRatio: CGFloat =
      dashes > 0 ? perimeter / CGFloat(dashes) : 0
      ZStack {
        StarPolygon(points:sides, density: density)
          .inset(by: dim * normalLineWidthRatio * 0.5)
          .trim(from: trim.0, to: trim.1)
          .stroke(
            style: StrokeStyle(
              lineWidth: normalLineWidthRatio * dim,
              lineCap: lineCap,
              lineJoin: lineJoin,
              dash: [strokeRatio * dashFillRatio, strokeRatio * (1.0 - dashFillRatio)],
              dashPhase: strokeRatio * dashPhaseRatio
            )
          )
          .frame(width: dim, height: dim)
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct StrokeStylePolygon_Previews: PreviewProvider {
  static var previews: some View {
    StrokeStyledPolygon(sides: 6)
      .frame(width: 256, height: 256)
      .previewLayout(.sizeThatFits)
  }
}
