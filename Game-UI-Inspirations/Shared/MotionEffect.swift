//
//  MotionEffect.swift
//
//  Created by nutterfi on 2/27/21.
//

import SwiftUI

struct MotionEffect: GeometryEffect {
  let useGravity: Bool
  let velocity: Double
  let emissionAngle: Angle
  var v: ((Double) -> Double) // what is this?
  var time: Double // seconds
  
  private let g = 9.81 // m/s^2
  
  var animatableData: Double {
    get { time }
    set { time = newValue }
  }
  
  func effectValue(size: CGSize) -> ProjectionTransform {
    let gravityOffset: Double = useGravity ? -0.5 * g * time * time : 0
    let dx = velocity * time * cos(emissionAngle.radians) //* v(time)
    let dy = velocity * time * sin(emissionAngle.radians) + gravityOffset // * v(time)
    
    let translation = CGAffineTransform(translationX: CGFloat(dx), y: CGFloat(-dy))
    return ProjectionTransform(translation)
  }
}
