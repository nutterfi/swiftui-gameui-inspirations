//
//  Motion.swift
//
//  Created by nutterfi on 2/27/21.
//

import SwiftUI

typealias VelocityProfile = (Double) -> Double

struct Velocity {
  static var dampedOscillator: VelocityProfile = { t in
    cos(t) * exp(t)
  }
}

struct Motion: ViewModifier {
  @State var time: Double = 0.0
  var duration: Double
  var useGravity: Bool
  var velocity: Double = Double.random(in: 0...10)
  var emissionAngle: Angle = .zero
  
  func body(content: Content) -> some View {
    let animation = Animation.linear(duration: duration)
      .repeatForever(autoreverses: false)
      .delay(Double.random(in: 0..<duration))
    let opacity = (duration - time) / duration
    
    let v: VelocityProfile = { t in
//      return cos(t) * exp(-1.0/2e10 * t)
      return t
    }
    
    return content
//      .opacity(opacity)
      .modifier(MotionEffect(useGravity: useGravity, velocity: velocity, emissionAngle: emissionAngle, v: v, time: time).ignoredByLayout())
      .onAppear {
        withAnimation(animation) {
          time = duration
        }
      }
  }
  
}
