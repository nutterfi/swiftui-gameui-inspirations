//
//  DragonCurveDemo.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 12/21/21.
//

import SwiftUI
import Shapes

// FIXME: Animation is not working
public extension DragonCurve {
  var animatableData: CGFloat {
    get {
      CGFloat(angleDegrees)
    }
    set {
      angleDegrees = Int(newValue)
    }
  }
}

struct DragonCurveDemo: View {
  @State private var iteration: Float = 8
  @State private var angle: Float = 90
  @State private var isAnimating = false
  var body: some View {
      ZStack {
        VStack {
          Text("\(Int(iteration))")
          Slider(value: $iteration, in: 1...20, step: 1) {
          } minimumValueLabel: {
            Text("1")
          } maximumValueLabel: {
            Text("20")
          }
          
          Text("\(Int(angle))")
          Slider(value: $angle, in: 1...179) {
          } minimumValueLabel: {
            Text("1")
          } maximumValueLabel: {
            Text("179")
          }
          
          Spacer()
          
          DragonCurve(steps: Int(iteration), angleDegrees: Int(angle))
            .stroke(Color.purple)
            .drawingGroup()
          
          DragonCurve(
            steps: Int(iteration),
            angleDegrees: isAnimating ? Int(angle) : 25
          )
            .stroke(Color.purple)
            .animation(Animation.linear(duration: 10).repeatForever(), value: isAnimating)
            .drawingGroup()
            .onChange(of: angle) { _ in
              isAnimating.toggle()
            }
            .onAppear {
              isAnimating.toggle()
            }
          
          Spacer()
        }
      }
    }
 
}

struct DragonCurveDemo_Previews: PreviewProvider {
  static var previews: some View {
    DragonCurveDemo()
  }
}
