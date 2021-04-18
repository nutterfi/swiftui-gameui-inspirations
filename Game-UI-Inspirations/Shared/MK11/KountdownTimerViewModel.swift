//
//  KountdownTimerViewModel.swift
//
//  Created by nutterfi on 3/11/21.
//

import Foundation
import Combine

class KountdownTimerViewModel: ObservableObject {
  @Published private(set) var count: Int = 200
  
  private var timer: Timer?
  
  init() {
    startTimer()
  }
  
  private func startTimer() {
    timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] (timer) in
      guard let s = self else { return }
      s.count -= 1
    }
    timer?.fire()
  }
}
