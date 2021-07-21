//
//  TestStrokeStyleCircle.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 7/12/21.
//

import SwiftUI

struct StrokeStyleCircleDemo: View {
  @State private var numberOfSegments = 10.0
  @State private var segmentRatio = 0.90
  @State private var scale = 0.8
  @State private var lineWidthRatio = 0.1
  @State private var dashPhaseRatio: CGFloat = 1.0

  var body: some View {
    VStack {
      Slider(value: $numberOfSegments, in: ClosedRange(uncheckedBounds: (1.0, 40.0))) {
        Text("Why can't we see this?")
      } minimumValueLabel: {
        Text("1")
      } maximumValueLabel: {
        Text("40")
      }
      
      Slider(value: $segmentRatio)
      Slider(value: $scale)
      Slider(value: $lineWidthRatio)
      Slider(value: $dashPhaseRatio)

      StrokeStyleCircle(numberOfSegments: Int(numberOfSegments), segmentRatio: segmentRatio, scale: scale, lineWidthRatio: lineWidthRatio, dashPhaseRatio: dashPhaseRatio)
        .foregroundStyle(LinearGradient(colors: [Color.blue, Color.purple], startPoint: .top, endPoint: .bottom))
    }
    .padding()
  }
}

struct StrokeStyleCircle: View {
  var numberOfSegments: Int = 4
  var segmentRatio: CGFloat = 0.9
  var scale: CGFloat = 1.0
  var lineWidthRatio: CGFloat = 0.1
  var trim: [CGFloat] = [0, 1]
  var dashPhaseRatio: CGFloat = 1.0

    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height) * scale
        let strokeRatio: CGFloat = .pi * dim / CGFloat(numberOfSegments)
        ZStack {
          Circle()
            .trim(from: trim[0], to: trim[1])
            .stroke(style: StrokeStyle(
              lineWidth: lineWidthRatio * dim,
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

struct TestStrokeStyleCircle_Previews: PreviewProvider {
    static var previews: some View {
      StrokeStyleCircleDemo()
    }
}
