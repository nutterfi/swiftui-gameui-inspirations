//
//  StrokeStyledCircle.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 7/12/21.
//

import SwiftUI

struct StrokeStyledCircle: View {
  var numberOfSegments: Int = 4
  var segmentRatio: CGFloat = 0.9
  var lineWidthRatio: CGFloat = 0.1
  var trim: (CGFloat, CGFloat) = (0, 1)
  var dashPhaseRatio: CGFloat = 1.0

    var body: some View {
      GeometryReader { proxy in
        let normalLineWidthRatio = lineWidthRatio.clamped(to: 0...CGFloat(0.5))
        let dim = min(proxy.size.width, proxy.size.height)
        let strokeRatio: CGFloat = .pi * dim * (1 - normalLineWidthRatio) / CGFloat(numberOfSegments)
        ZStack {
          Circle()
            .inset(by: dim * normalLineWidthRatio * 0.5)
            .trim(from: trim.0, to: trim.1)
            .stroke(
              style: StrokeStyle(
                lineWidth: normalLineWidthRatio * dim,
                dash: [strokeRatio * segmentRatio, strokeRatio * (1.0 - segmentRatio)],
                dashPhase: strokeRatio * dashPhaseRatio
              )
            )
            .frame(width: dim, height: dim)
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct StrokeStyledCircle_Previews: PreviewProvider {
    static var previews: some View {
      StrokeStyledCircle()
    }
}
