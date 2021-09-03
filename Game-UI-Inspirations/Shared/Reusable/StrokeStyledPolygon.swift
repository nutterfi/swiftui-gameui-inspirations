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
  var dashFillRatio: CGFloat = 0.7
  var lineWidthRatio: CGFloat = 0.01
  var dashPhaseRatio: CGFloat = 0.36
  var lineCap: CGLineCap = .round
  var lineJoin: CGLineJoin = .miter
  
  var body: some View {
    
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      let perimeter = CGFloat(sides) * dim * sin(.pi / CGFloat(sides))
      let strokeRatio: CGFloat =
      dashes > 0 ? perimeter / CGFloat(dashes) : 0
      ZStack {
        ConvexPolygon(sides:sides)
          .stroke(style: StrokeStyle(
            lineWidth: lineWidthRatio * dim,
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
      .padding()
  }
}
