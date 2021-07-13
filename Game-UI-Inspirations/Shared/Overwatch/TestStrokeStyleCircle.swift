//
//  TestStrokeStyleCircle.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 7/12/21.
//

import SwiftUI

struct StrokeStyleCircleDemo: View {
  @State private var numberOfSegments = 4.0
  @State private var segmentRatio = 0.90
  @State private var ratio = 1.0
  @State private var lineWidthRatio = 0.1

  var body: some View {
    VStack {
      Slider(value: $numberOfSegments, in: ClosedRange(uncheckedBounds: (1.0, 40.0)))
      Slider(value: $segmentRatio)
      Slider(value: $ratio)
      Slider(value: $lineWidthRatio)

      StrokeStyleCircle(numberOfSegments: Int(numberOfSegments), segmentRatio: segmentRatio, ratio: ratio, lineWidthRatio: lineWidthRatio)
    }
  }
}

struct StrokeStyleCircle: View {
  var numberOfSegments: Int = 4
  var segmentRatio: CGFloat = 0.9
  var ratio: CGFloat = 1.0
  var lineWidthRatio: CGFloat = 0.1
  var trim: [CGFloat] = [0, 1]

    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height) * ratio
        ZStack {
          Circle()
            .trim(from: trim[0], to: trim[1])
            .stroke(style: StrokeStyle(lineWidth: lineWidthRatio * dim, dash: [
              .pi * dim / CGFloat(numberOfSegments) * segmentRatio, .pi * dim / CGFloat(numberOfSegments) * (1.0 - segmentRatio)]))
            .frame(width: dim, height: dim)
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct TestStrokeStyleCircle_Previews: PreviewProvider {
    static var previews: some View {
      StrokeStyleCircleDemo()
        .padding()
    }
}
