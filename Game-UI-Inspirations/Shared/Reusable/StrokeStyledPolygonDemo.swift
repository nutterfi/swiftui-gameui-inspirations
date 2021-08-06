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
        Text("segment ratio: \(segmentRatio)")
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
        
        Text("Line Width Ratio: \(lineWidthRatio)")
        Slider(value: $lineWidthRatio)
        
        Text("Dash Phase Ratio: \(dashPhaseRatio)")
        Slider(value: $dashPhaseRatio)
      }
      
      StrokeStyledPolygon(sides: Int(numberOfSides), dashes: Int(numberOfDashes), dashFillRatio: segmentRatio, lineWidthRatio: lineWidthRatio, dashPhaseRatio: dashPhaseRatio, lineCap: lineCap, lineJoin: lineJoin)
        .foregroundStyle(LinearGradient(colors: [Color.blue, Color.purple], startPoint: .top, endPoint: .bottom))

    }
    .padding()
  }
}

struct StrokeStylePolygonDemo_Previews: PreviewProvider {
    static var previews: some View {
      StrokeStyledPolygonDemo()
    }
}
