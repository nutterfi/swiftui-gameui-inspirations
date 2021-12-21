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
  @State private var trim: CGFloat = 0.8
  @State private var lineWidthRatio = 0.1
  @State private var dashPhaseRatio: CGFloat = 1.0

  var body: some View {
    VStack {
      Slider(value: $numberOfSegments, in: ClosedRange(uncheckedBounds: (1.0, 40.0))) {
      } minimumValueLabel: {
        Text("1")
      } maximumValueLabel: {
        Text("40")
      }
      
      Text("Segment Ratio")
      Slider(value: $segmentRatio) {}
        minimumValueLabel: {
          Text("0")
        } maximumValueLabel: {
          Text("1")
        }
      
      Text("Trim")
      Slider(value: $trim)
      
      Text("Line Width Ratio")
      Slider(value: $lineWidthRatio, in: ClosedRange(uncheckedBounds: (0.0, 0.5))) {
      }
      
      Text("Dash Phase Ratio")
      Slider(value: $dashPhaseRatio)

      StrokeStyledCircle(
        numberOfSegments: Int(numberOfSegments),
        segmentRatio: segmentRatio,
        lineWidthRatio: lineWidthRatio,
        trim: (0, trim),
        dashPhaseRatio: dashPhaseRatio
      )
        .foregroundStyle(LinearGradient(colors: [Color.blue, Color.purple], startPoint: .top, endPoint: .bottom))
        .border(Color.purple)
    }
    .padding()
  }
}

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

struct TestStrokeStyleCircle_Previews: PreviewProvider {
    static var previews: some View {
      StrokeStyleCircleDemo()
    }
}
