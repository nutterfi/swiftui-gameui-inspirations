//
//  Path+Extensions.swift
//
//  Created by nutterfi on 2/27/21.
//

import SwiftUI

extension Path {
  // an equally spaced collection of points around the path
  func equallySpacedPoints(count: Int) -> [CGPoint] {
    let dp: CGFloat = 1.0 / CGFloat(count)
    var points = [CGPoint]()
    let samples = stride(from: 0.0, to: 1.0, by: Double.Stride(dp))
    
    samples.forEach { (p) in
      let tp = self.trimmedPath(from: CGFloat(p)-dp, to: CGFloat(p)+dp)
      points.append(CGPoint(x: tp.boundingRect.midX, y: tp.boundingRect.midY))
    }
    return points
  }
}
