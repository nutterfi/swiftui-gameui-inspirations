//
//  StrokeStyledPolygonDemo.swift
//  StrokeStyledPolygonDemo
//
//  Created by nutterfi on 8/3/21.
//

import SwiftUI

struct StrokeStyledPolygonDemo: View {
  @State private var numberOfSides = 6.0
  @State private var numberOfDashes = 6.0
  @State private var segmentRatio = 0.70
  @State private var lineCap: CGLineCap = .round
  @State private var lineJoin: CGLineJoin = .miter
  @State private var lineWidthRatio = 0.01
  @State private var dashPhaseRatio: CGFloat = 0.36
  @State private var density: CGFloat = 1.0
  @State private var trim: CGFloat = 1.0

  // TODO: Save FEATURE!
  /**
    12 sides, density 2, dashes 14, segment ratio 0.47, round, miter, .1 line width ration, 0.52 dash phase ratio
   */
  var body: some View {
    VStack {
      Group {
        Text("number of sides: \(Int(numberOfSides))")
        Slider(value: $numberOfSides, in: ClosedRange(uncheckedBounds: (3.0, 20.0))) {
        } minimumValueLabel: {
          Text("3")
        } maximumValueLabel: {
          Text("20")
        }
        
        Text("Density: \(Int(density))")

        Slider(value: $density, in: ClosedRange(uncheckedBounds: (1.0, 10.0))) {
        } minimumValueLabel: {
          Text("1")
        } maximumValueLabel: {
          Text("10")
        }
        
      }
      
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
        Text("segment ratio: \(String(format: "%.02f", segmentRatio))")
        Slider(value: $segmentRatio)
        
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
      
      StrokeStyledPolygon(
        sides: Int(numberOfSides),
        dashes: Int(numberOfDashes),
        density: Int(density),
        dashFillRatio: segmentRatio,
        lineWidthRatio: lineWidthRatio,
        dashPhaseRatio: dashPhaseRatio,
        lineCap: lineCap,
        lineJoin: lineJoin,
        trim: (0, trim)
      )
        .foregroundStyle(LinearGradient(colors: [Color.blue, Color.purple], startPoint: .top, endPoint: .bottom))
        .border(Color.purple)

    }
    .padding()
  }
}

struct StrokeStylePolygonDemo_Previews: PreviewProvider {
    static var previews: some View {
      StrokeStyledPolygonDemo()
    }
}
