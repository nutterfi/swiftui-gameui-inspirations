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
  
  private var outerTick: Int = 0
  private let tickMax = 50

  init() {
    startTimer()
  }
  
  func startTimer() {
    timer = Timer.scheduledTimer(withTimeInterval: 1.0 / 30, repeats: true) { [weak self] (timer) in
      guard let s = self else { return }
      s.updateRotations()
    }
    timer?.fire()
  }
  
  private func updateRotations() {
    // every 50 ticks, update outerRotation
    outerTick += 1
    if outerTick % tickMax == 0 {
      outerRotation -= 0.1
    }
    innerRotation += 0.1
  }
}
