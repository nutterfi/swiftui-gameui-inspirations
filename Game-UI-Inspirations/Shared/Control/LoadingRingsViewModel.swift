//
//  ViewModel.swift
//  Control-Loading-Animations
//
//  Created by nutterfi on 3/2/21.
//

/*
 // CIRCLES APPEARING
 0. Entire view is rotating at constant angular velocity
 1. Inner Ring animate in at some rate dArc/dt beginning at 90 degrees (N)
 2. Once it gets to 2/3 of inner ring, start the middle ring at same rate
 3. Once middle ring gets to 2/3, start outer ring at same rate
 4. Once full, wait for some time t
 5. STOP ROTATION!
 
 // CIRCLES DISAPPEARING
 
 6. Inner starts disappearing at -90 degrees (S) at same dArc/dt
 7. Once inner gets halfway, start disappearing middle beginning at -90 deg (S) at same dArc/dt
 8. Once mid gets halfway, start disappearing outer beginning at -90 deg (S) at same dArc/dt
 9. ???
 10. Profit
 */

// TODO: Fix rotation angle for decreasing case
// TODO: Add delays for start and rest states

enum CircleAnimationState: CaseIterable {
  case start
  case increasing
  case rest
  case decreasing
}

import Foundation
import CoreGraphics
import Combine

class LoadingRingsViewModel: ObservableObject {
  
  // NORMALIZED TRIM LENGTHS between 0.0 - 1.0
  @Published private(set) var innerTrimTo: CGFloat = 0.0
  @Published private(set) var middleTrimTo: CGFloat = 0.0
  @Published private(set) var outerTrimTo: CGFloat = 0.0
  
  @Published private(set) var innerTrimFrom: CGFloat = 0.0
  @Published private(set) var middleTrimFrom: CGFloat = 0.0
  @Published private(set) var outerTrimFrom: CGFloat = 0.0
  
  // ROTATIONS in RADIANS
  @Published private(set) var innerRotation: CGFloat = 0.0
  @Published private(set) var middleRotation: CGFloat = 0.0
  @Published private(set) var outerRotation: CGFloat = 0.0
  
  private var timer: Timer?
  
  private var state: CircleAnimationState = .start
  private var trimRate: CGFloat = 0.1
  
  init() {
    startTimer()
  }
  
  private func startTimer() {
    timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] (timer) in
      guard let s = self else { return }
      
      switch s.state {
      case .start:
        s.start()
      case .increasing:
        s.increase()
      case .rest:
        s.rest()
      case .decreasing:
        s.decrease()
      }
    }
    timer?.fire()
  }
  
  private func start() {
    innerRotation = -.pi / 2
    innerTrimFrom = 0
    middleTrimFrom = 0
    outerTrimFrom = 0
    innerTrimTo = 0
    middleTrimTo = 0
    outerTrimTo = 0
    trimRate = 0.1
    state = .increasing
  }
  
  private func rest() {
    innerRotation = .pi / 2
    trimRate = 0.2
    state = .decreasing
  }
  
  // logic to increase the trims and rotations
  private func increase() {
    if innerTrimTo < 1 {
      innerTrimTo += trimRate
    }
    
    innerRotation += trimRate
    middleRotation = innerRotation
    outerRotation = innerRotation
    
    if innerTrimTo >= 2.0/3 {
      middleTrimTo += trimRate
    }
    
    if middleTrimTo >= 2.0/3 {
      outerTrimTo += trimRate
    }
    
    innerTrimTo = min(innerTrimTo, 1.0)
    middleTrimTo = min(middleTrimTo, 1.0)
    outerTrimTo = min(outerTrimTo, 1.0)
    
    if outerTrimTo == 1.0 { state = .rest }
  }
  
  // logic to decrease the trims and rotations
  private func decrease() {
    // s.state = .start
    if innerTrimFrom < 1 {
      innerTrimFrom += trimRate
    }
    
    middleRotation = innerRotation
    outerRotation = innerRotation
    
    if innerTrimFrom > 0.5 {
      middleTrimFrom += trimRate
    }
    
    if middleTrimFrom > 0.5 {
      outerTrimFrom += trimRate
    }
    
    innerTrimFrom = min(max(innerTrimFrom, 0), 1)
    middleTrimFrom = min(max(middleTrimFrom, 0), 1)
    outerTrimFrom = min(max(outerTrimFrom, 0), 1)
    
    if outerTrimFrom == 1 { state = .start }
  }
  
}
