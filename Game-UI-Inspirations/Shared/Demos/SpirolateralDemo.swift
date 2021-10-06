//
//  SpirolateralDemo.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 10/3/21.
//

import SwiftUI
import Shapes

/**
 the spirolateral is defined by three basic factors: the turning angle, the
 number of segments or turns, and the number of repetitions, which create a closed figure.
 */
struct SpirolateralDemo: View {
  @State private var turns: CGFloat = 6.0
  @State private var turningAngle: CGFloat = 68.0
  @State private var repetitions: CGFloat = 10.0
  @State private var reversals: [Bool] = Array(repeating: false, count: 10)
  
  @State private var fill: Bool = false
  @State private var eoFill: Bool = false
  @State private var modern: Bool = false
  
  
  var body: some View {
    VStack {
      
      Toggle("Modern", isOn: $modern)
      
      Text("\(Int(turns))")
      HStack {
        Text("Turns: 1")
        Slider(value: $turns, in: 1...10, step: 1)
        Text("10")
      }
      
      // Array of toggle switches that will determine reverse indexes
      let columns = [GridItem(), GridItem(), GridItem()]
      LazyVGrid(columns: columns) {
        ForEach(0..<Int(turns), id: \.self) { index in
          Toggle("Reverse \(index+1)", isOn: $reversals[index])
        }
      }
      
      VStack {
        Text("\(Int(turningAngle))")
        HStack {
          Text("Turning Angle: 1deg")
          Slider(value: $turningAngle, in: 1...179, step: 1)
          Text("179deg")
        }
      }
      
      VStack {
        Text("\(Int(repetitions))")
        HStack {
          Text("Repetitions: 1")
          Slider(value: $repetitions, in: 1...100, step: 1)
          Text("10")
        }
      }
      
      Toggle("fill", isOn: $fill)
      Toggle("eofill", isOn: $eoFill)
      
      let indexes = reversals.indices
        .filter {reversals[$0]}
        .map {$0 + 1}
      
      if fill {
        Spirolateral(turns: modern ? [2, 1, -2, 3, -4, 3] : [Int(turns)], turningAngle: turningAngle, repetitions: Int(repetitions), reversedIndexes: indexes)
          .fill(Color.purple, style: .init(eoFill: eoFill, antialiased: true))
          .scaledToFit()
        
      } else {
        Spirolateral(turns: modern ? [2, 1, -2, 3, -4, 3] : [Int(turns)], turningAngle: turningAngle, repetitions: Int(repetitions), reversedIndexes: indexes)
          .stroke(Color.purple, lineWidth: 3)
          .scaledToFit()
        
      }
    }
    .padding()
  }
}


struct SpirolateralDemo_Previews: PreviewProvider {
    static var previews: some View {
      SpirolateralDemo()
        .previewDevice("iPad Pro (12.9-inch) (5th generation)")
    }
}
