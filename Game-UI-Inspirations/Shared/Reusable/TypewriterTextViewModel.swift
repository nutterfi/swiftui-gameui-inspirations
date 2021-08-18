//
//  TypewriterTextViewModel.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 7/13/21.
//

import Foundation

class TypewriterTextViewModel: ObservableObject {
  var input: String = ""
  
  @Published var text: String = ""
  @Published var index: Int = 0
  
  private let timeInterval: TimeInterval = 0.1
  private var timer: Timer?
  
  init(input: String = "") {
    self.input = input
  }
  
  func start() {
    index = 0
    startTimer()
  }
  
  private func startTimer() {
    timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { [weak self] (timer) in
      guard let s = self else { return }
      s.updateIndex()
    }
    timer?.fire()
  }
                                 
  private func updateIndex() {
    
    index += 1
    if index >= input.count {
      timer?.invalidate()
      DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
        self.text = ""
      }
    }
    let mySubstring = input.prefix(index)
    text = String(mySubstring)
  }
  
}
