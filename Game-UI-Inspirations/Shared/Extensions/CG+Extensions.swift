//
//  CG+Extensions.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 2/1/22.
//

import CoreGraphics
import SwiftUI

extension CGVector {
  init(_ magnitude: Double, theta: Angle) {
    self.init(dx: magnitude * cos(theta.radians), dy: magnitude * sin(theta.radians))
  }
}
