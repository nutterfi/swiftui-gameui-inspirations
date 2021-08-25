//
//  TypewriterTextViewModel.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 7/13/21.
//

import Foundation

class TextEffectViewModel: ObservableObject {
  
  @Published var value: Double = 0
  
  private let timeInterval: TimeInterval = 0.013
  private var timer: Timer?
  
  func start() {
    startTimer()
  }
  
  deinit {
    timer?.invalidate()
  }
  
  private func startTimer() {
    timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { [weak self] (timer) in
      guard let s = self else { return }
      s.updateValue()
    }
    timer?.fire()
  }
                                 
  private func updateValue() {
    value += timeInterval
  }
  
}
