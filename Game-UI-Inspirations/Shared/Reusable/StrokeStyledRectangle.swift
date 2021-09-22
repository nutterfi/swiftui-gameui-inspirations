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
  
  var body: some View {
    
    GeometryReader { proxy in
      let perimeter = 2 * (proxy.size.width + proxy.size.height)
      let strokeRatio: CGFloat =
      dashes > 0 ? perimeter / CGFloat(dashes) : 0
      ZStack {
        Rectangle()
          .stroke(style: StrokeStyle(
            lineWidth: 1, // linewidthratio
            lineCap: lineCap,
            lineJoin: lineJoin,
            dash: [strokeRatio * dashFillRatio, strokeRatio * (1.0 - dashFillRatio)],
            dashPhase: strokeRatio * dashPhaseRatio
          )
          )
          .frame(width: proxy.size.width, height: proxy.size.height)
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct StrokeStyledRectangle_Previews: PreviewProvider {
  static var previews: some View {
    StrokeStyledRectangle()
      .padding()
      .frame(width: 256, height: 256)
  }
}
