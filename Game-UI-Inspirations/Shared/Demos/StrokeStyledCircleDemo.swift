//
//  StrokeStyledCircleDemo.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 12/20/21.
//

import SwiftUI
import Shapes

struct StrokeStyledCircleDemo: View {
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

struct StrokeStyledCircleDemo_Previews: PreviewProvider {
    static var previews: some View {
        StrokeStyledCircleDemo()
    }
}
