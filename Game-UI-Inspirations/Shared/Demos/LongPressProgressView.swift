//
//  LongPressProgressView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 12/4/21.
//

import SwiftUI
import Shapes

class LongPressHoldModel: ObservableObject {
  
  @Published private(set) var unlocked: Bool = false
  @Published var progress: CGFloat = 0.0 {
    didSet {
      if progress >= 1.0 {
        timer?.invalidate()
        unlocked = true
      }
    }
  }
  
  private var timer: Timer?
  
  func start() {
    timer = Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { [weak self] (timer) in
      guard let s = self else {
        timer.invalidate()
        return
      }
      
      s.update()
    }
    timer?.fire()
  }
  
  func end() {
    timer?.invalidate()
    unlocked = false
    progress = 0
  }
  
  @objc private func update() {
    DispatchQueue.main.async {
      self.progress += 0.02
    }
  }
}

struct LongPressProgressView: View {
  
  @StateObject private var model = LongPressHoldModel()
  
  var body: some View {
    ZStack {
      MaskedProgressBar(
        progress: Float(model.progress),
        backView: Color.gray,
        frontView: model.unlocked ? Color.blue : Color.yellow,
        mask: ConvexPolygon(sides: 5)
      )
        .frame(width: 100, height: 100, alignment: .center)
        .longPressHoldable(action: { state in
          switch state {
          case .inactive:
            model.end()
          case .holding:
            model.start()
          case .pressing:
            break
          }
        })
        .rotationEffect(.degrees(-90))
        .animation(Animation.easeIn(duration: 0.2), value: model.progress)
    }
  }
}

struct LongPressProgressView_Previews: PreviewProvider {
  static var previews: some View {
    LongPressProgressView()    
  }
}
