//
//  StrokeStyledRectangleDemo.swift
//
//  Created by nutterfi on 8/3/21.
//

import SwiftUI

struct StrokeStyledRectangleDemo: View {
  @State private var numberOfDashes = 4.0
  @State private var dashFillRatio = 0.70
  @State private var lineCap: CGLineCap = .round
  @State private var lineJoin: CGLineJoin = .miter
  @State private var lineWidthRatio = 0.01
  @State private var dashPhaseRatio: CGFloat = 0.36
  @State private var trim: CGFloat = 0.8

  // TODO: Save FEATURE!
  /**
    12 sides, density 2, dashes 14, segment ratio 0.47, round, miter, .1 line width ration, 0.52 dash phase ratio
   */
  var body: some View {
    VStack {
      Group {
        Text("number of dashes: \(Int(numberOfDashes))")
        Slider(value: $numberOfDashes, in: ClosedRange(uncheckedBounds: (1.0, 40.0))) {
        } minimumValueLabel: {
          Text("1")
        } maximumValueLabel: {
          Text("40")
        }
      }
      
      Group {
        Text("Dash fill ratio: \(String(format: "%.02f", dashFillRatio))")
        Slider(value: $dashFillRatio)
        
        Picker("Cap", selection: $lineCap) {
          Text("Round").tag(CGLineCap.round)
          Text("Square").tag(CGLineCap.square)
          Text("Butt").tag(CGLineCap.butt)
        }
        
        Picker("Join", selection: $lineJoin) {
          Text("Round").tag(CGLineJoin.round)
          Text("Bevel").tag(CGLineJoin.bevel)
          Text("Miter").tag(CGLineJoin.miter)
        }
        
        Text("Line Width Ratio: \(String(format: "%.02f", lineWidthRatio))")
        Slider(value: $lineWidthRatio)
        Text("Dash Phase Ratio: \(String(format: "%.02f", dashPhaseRatio))")
        Slider(value: $dashPhaseRatio)
        
        Text("Trim")
        Slider(value: $trim)
      }
      
      StrokeStyledRectangle(
        dashes: Int(numberOfDashes),
        dashFillRatio: dashFillRatio,
        lineWidthRatio: lineWidthRatio,
        dashPhaseRatio: dashPhaseRatio,
        lineCap: lineCap,
        lineJoin: lineJoin,
        trim: (0, trim))
        .foregroundStyle(LinearGradient(colors: [Color.blue, Color.purple], startPoint: .top, endPoint: .bottom))

    }
    .padding()
  }
}

struct StrokeStyledRectangleDemo_Previews: PreviewProvider {
    static var previews: some View {
      StrokeStyledRectangleDemo()
    }
}
