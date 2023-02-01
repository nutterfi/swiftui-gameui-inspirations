import SwiftUI
import Shapes

class GuardianFadeTransitionModel: ObservableObject {
  @Published var points: [CGPoint] = []
  
  private var timer: Timer?
  private var duration: TimeInterval = .zero
  private var timeInterval: TimeInterval = 1/30
  private var maxRows: Int = 1
  private var maxColumns: Int = 1
  
  func begin(maxRows: Int, maxColumns: Int, duration: TimeInterval) {
    self.duration = duration
    self.maxRows = maxRows
    self.maxColumns = maxColumns
    
    timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true, block: { timer in
      self.duration -= self.timeInterval
      if self.duration <= 0 {
        self.timer?.invalidate()
        return
      }
      
      self.doSomething()
    })
    timer?.fire()
  }
  
  private func doSomething() {
    let numberOfIndices = Int(self.duration * 1000)
    var points: [CGPoint] = []
    for _ in 0..<numberOfIndices {
      let r = Int.random(in: 0..<maxRows)
      let c = Int.random(in: 0..<maxColumns)
      points.append(CGPoint(x: r, y: c))
    }
    self.points = points
  }
}

struct GuardianFadeTransition: View {
  @StateObject private var model = GuardianFadeTransitionModel()
  
  var body: some View {
    ZStack {
      let count = model.points.count
      let duration = 0.5
      let opacity = 1.0 - CGFloat(count)/(duration * 1000)
      RandomIndexedTiledShape(
        shape: Rectangle(),
        rows: 5,
        columns: 8,
        unpaintedIndices: model.points)
      .foregroundColor(.gotgGreen.opacity(opacity))
    }
    .task {
      model.begin(maxRows: 8, maxColumns: 16, duration: 0.5)
    }
  }
}

struct MenuTransitionAnimation_Previews: PreviewProvider {
  static var previews: some View {
    GuardianFadeTransition()
  }
}
