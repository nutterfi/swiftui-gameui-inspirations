//
//  MGSVLoadingViewModel.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/22/21.
//

import Foundation
import SwiftUI

class MGSVLoadingViewModel: ObservableObject {
  // ROTATIONS in RADIANS
  @Published private(set) var innerRotation: CGFloat = 0.0
  @Published private(set) var outerRotation: CGFloat = 0.0
  
  private var timer: Timer?
  private let timeInterval: TimeInterval = 1.0 / 30
  private var outerTick: Int = 0
  private let tickMax = 15

  private var deltaRotation: CGFloat {
    2 * .pi * CGFloat(timeInterval)
  }
  
  init() {
    startTimer()
  }
  
  func startTimer() {
    timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { [weak self] (timer) in
      guard let s = self else { return }
      s.updateRotations()
    }
    timer?.fire()
  }
  
  private func updateRotations() {
    outerTick += 1
    if outerTick % tickMax == 0 {
      outerRotation -= deltaRotation
    }
    innerRotation += deltaRotation
  }
}
