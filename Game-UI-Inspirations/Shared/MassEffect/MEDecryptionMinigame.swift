import SwiftUI
import Shapes

/**
 1. SwiftUI Shape Collision Detection
 2. Timer to track game duration
 3. Draw enemies - DONE
 4. Draw player - DONE
 5. Gesture Detection - two-finger rotate, pinch to zoom
 6. ???
 7. Profit
 */

class MEDecryptionMinigameModel: ObservableObject {
  /// Rotation in degrees
  @Published private(set) var rotation: CGFloat = .zero
  
  private var timer: Timer?

  init() {
    startTimer()
  }
  
  private func startTimer() {
    timer = Timer.scheduledTimer(withTimeInterval: 1/60, repeats: true) { [weak self] (timer) in
      guard let s = self else { return }
      
      s.rotation = CGFloat((Int(s.rotation) + 1) % 360)
    }
    timer?.fire()
  }
}

struct TestCollision<T: Shape, U: Shape>: Shape {
  var shape1: T
  var shape2: U
  var rect1: CGRect
  var rect2: CGRect
  
  init(shape1: T, shape2: U, rect1: CGRect, rect2: CGRect) {
    self.shape1 = shape1
    self.shape2 = shape2
    self.rect1 = rect1
    self.rect2 = rect2
  }
  
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.addPath(shape1.path(in: rect1))
      path.addPath(shape2.path(in: rect2))
    }
  }
}

extension CGRect {
  func offsetBy(magnitude: Double, angle: Angle) -> CGRect {
    let x = magnitude * cos(angle.radians)
    let y = magnitude * sin(angle.radians)
    return self.offsetBy(dx: x, dy: y)
  }
}

extension Color {
  static let meFroggerBlue = Color(red: 10/255, green: 35/255, blue: 80/255)
  static let meFroggerMoreBluer = Color(red: 14/255, green: 23/255, blue: 90/255)
  static let meFroggerEvenMoreBluerer = Color(red: 9/255, green: 17/255, blue: 72/255)
  static let meFroggerPlayer = Color(red: 36/255, green: 141/255, blue: 176/255)
  
  static let meWinFroggerGreen = Color(red: 10/255, green: 200/255, blue: 60/255)
  
  static let meFroggerGray = Color(white: 58/255)

}

struct MEDecryptionMinigame: View {
  /// The player position in polar coordinates
  @State private var magnitude: CGFloat = 1
  @State private var angle: CGFloat = 0
  @State private var gameState: GameState = .start
  @StateObject var model = MEDecryptionMinigameModel()
  
  enum GameState {
    case start, fail, win
  }
  
  /// square size inferred (512x512)
  let arenaSize: CGFloat = 512
  let playerSize: CGFloat = 32
  
  var playerPosition: CGRect {
    CGRect(origin: CGPoint(x: arenaSize * 0.5, y: arenaSize * 0.5), size: .init(width: playerSize, height: playerSize))
      .offsetBy(dx: -0.5 * playerSize, dy: -0.5 * playerSize)
      .offsetBy(magnitude: magnitude * arenaSize * 0.5 * 0.92, angle: .radians(Double(angle) * 2.0 * .pi))
  }
  
  var rotatedPlayer: some Shape {
    let player = IsoscelesTriangle()
    
    let vertex = CGPoint(x: playerPosition.midX, y: playerPosition.midY)
    
    let angle = atan2((vertex.y - arenaRect.midY), (vertex.x - arenaRect.midX))
    
    let rotatedPlayer = player.path(in: playerPosition)
      .rotation(.radians(angle + CGFloat.pi / 2 + CGFloat.pi))
    
    return rotatedPlayer
  }
  
  var arenaRect: CGRect {
    CGRect(origin: .zero, size: .init(width: arenaSize, height: arenaSize))
  }
  
  var securityPattern: some NFiShape {
    StrokeStyledCircle(
      numberOfSegments: 4,
    dashPattern: [25, 75],
    lineWidth: 20
    )
  }
  
  var enemyCollisionDetected: Bool {
    rotatedPlayer.path(in: playerPosition).cgPath
      .intersects(securityGroup.path(in: arenaRect).cgPath)
  }
  
  var boundaryCollisionDetected: Bool {
    rotatedPlayer.path(in: playerPosition).cgPath
      .intersects(securityGroup.path(in: arenaRect).cgPath)
  }
  
  var goalCollisionDetected: Bool {
    rotatedPlayer.path(in: playerPosition).cgPath
      .intersects(goal.path(in: arenaRect).cgPath)
  }
  
  var ringWidth: CGFloat {
    arenaSize / 13
  }
  
  var goal: some Shape {
    Circle().inset(by: ringWidth * 5)
  }
  
  var boundaryGroup: some Shape {
    securityPattern
      .inset(by: ringWidth)
      .adding(
        securityPattern
          .inset(by: ringWidth * 2)
          .rotation(.degrees(135))
        )
      .adding(
        securityPattern
          .inset(by: ringWidth * 3)
          .rotation(.degrees(2))
      )
      .adding(
        securityPattern
          .inset(by: ringWidth * 4)
      )
    
  }
  
  var securityGroup: some Shape {
    securityPattern
      .inset(by: ringWidth)
      .rotation(.degrees(model.rotation))
      .adding(
        securityPattern
          .inset(by: ringWidth * 2)
          .rotation(.degrees(model.rotation))
      )
      .adding(
        securityPattern
          .inset(by: ringWidth * 3)
          .rotation(.degrees(-model.rotation))
      )
      .adding(
        securityPattern
          .inset(by: ringWidth * 4)
          .rotation(.degrees(model.rotation * 2.3))
      )
  }
  
  func resultView(win: Bool) -> some View {
    let color: Color = win ? .meWinFroggerGreen : .red
    let text: String = win ? "Override Succeeded" : "Override Failed"
    return ZStack {
      Group {
        Ellipse()
          .frame(width: arenaSize, height: 128)
          .blur(radius: 10)
          .foregroundColor(color.opacity(0.6))
        
        Ellipse()
          .frame(width: arenaSize * 3/13, height: 128)
          .blur(radius: 20)
          .foregroundColor(color.opacity(0.7))
      }
      .mask(
        Rectangle()
          .frame(width: arenaSize * 11/13, height: arenaSize)
      )
      
      VStack(spacing: 0) {
        HorizontalLine().stroke(lineWidth: 2).foregroundColor(color)
        ZStack {
          
          Color.meFroggerGray
          Ellipse()
            .blur(radius: 5)
            .foregroundColor(.black)
            .frame(width: arenaSize * 9/13, height: 32)
          Text(text)
            .font(.system(.title2))
            .bold()
            .foregroundColor(color)
        }
        
        HorizontalLine().stroke(lineWidth: 2).foregroundColor(color)
      }
      .frame(width: arenaSize * 11/13, height: 36)
    }
    
  }
  
  var failView: some View {
    EmptyView()
  }
  
  var body: some View {
    VStack {
      Slider(value: $magnitude)
      Slider(value: $angle)

      // DECRYPTION ARENA
      ZStack {
        Color.black.opacity(0.8)
        Circle().stroke() // outer border
        
        // Draw background circles
        ForEach(0...4, id: \.self) { index in
          Circle()
            .inset(by: CGFloat(index) * ringWidth)
            .strokeBorder(lineWidth: ringWidth)
            .foregroundColor(index % 2 == 0 ? Color.meFroggerBlue : Color.meFroggerMoreBluer)
        }
        
        goal.foregroundColor(.meFroggerEvenMoreBluerer)
        
        rotatedPlayer.path(in: playerPosition)
          .foregroundColor(.meFroggerPlayer)

        securityGroup.path(in: arenaRect).foregroundColor(.red).border(Color.black)
        
        boundaryGroup.path(in: arenaRect).foregroundColor(.orange).border(Color.black)
        
        
        switch gameState {
          case .start:
            EmptyView()
          case .win:
            resultView(win: false)
          case .fail:
            resultView(win: false)
        }
        
      }
      .frame(width: arenaSize, height: arenaSize)
      .border(Color.red)
      
      Spacer()
    }
    .onChange(of: magnitude) { newValue in
      update()
    }
    .onChange(of: angle) { newValue in
      update()
    }
    .onChange(of: model.rotation) { newValue in
      update()
    }
  }
  
  func update() {
    // timer runs out? gameState = .lose else ...
    if enemyCollisionDetected {
      magnitude = 1
      angle = .zero
      // force gesture to end
    }
    if goalCollisionDetected {
      gameState = .win
    }
    
  }
}

struct MEDecryptionMinigame_Previews: PreviewProvider {
  static var previews: some View {
    MEDecryptionMinigame()
  }
}
