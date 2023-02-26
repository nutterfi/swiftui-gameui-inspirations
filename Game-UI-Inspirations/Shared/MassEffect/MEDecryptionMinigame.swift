import SwiftUI
import Shapes

/**
 1. SwiftUI Shape Collision Detection - DONE
 2. Timer to track game duration
 3. Draw enemies - DONE
 4. Draw player - DONE
 5. Gesture Detection - two-finger rotate, pinch to zoom
 6. ???
 7. Profit
 */

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

/// Game Engine
class MEMinigameEngine: ObservableObject {
  /// Rotation in degrees
  @Published private(set) var enemyRotation: CGFloat = .zero
  
  // These are for debugging only
  @Published private(set) var deltaTimeStamp: TimeInterval = .zero
  @Published private(set) var lastTimeStamp: TimeInterval = CACurrentMediaTime()
  //
  
  /// #MARK -- Player
  
  /// The player position in polar coordinates - User Input
  @Published var magnitude: CGFloat = 1
  @Published var angle: CGFloat = 0
  
  private let enemyRotationSpeed = 360.0/5
  private var displayLink: CADisplayLink?
  
  enum GameState {
    case start, fail, win
  }
  
  @Published private(set) var gameState: GameState = .start
  
  init() {
    createDisplayLink()
  }
  
  deinit {
    displayLink?.invalidate()
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
      .rotation(.degrees(enemyRotation))
      .adding(
        securityPattern
          .inset(by: ringWidth * 2)
          .rotation(.degrees(enemyRotation))
      )
      .adding(
        securityPattern
          .inset(by: ringWidth * 3)
          .rotation(.degrees(-enemyRotation))
      )
      .adding(
        securityPattern
          .inset(by: ringWidth * 4)
          .rotation(.degrees(enemyRotation * 2.3))
      )
  }
  
  //  MARK: Game Tick
  
  private func createDisplayLink() {
    displayLink = CADisplayLink(target: self, selector: #selector(step))
    displayLink?.add(to: .current, forMode: .default)
  }
  
  @objc private func step(displaylink: CADisplayLink) {
    deltaTimeStamp = displaylink.timestamp - lastTimeStamp
    
    let deltaRotation = deltaTimeStamp * enemyRotationSpeed
    enemyRotation = CGFloat((Int(enemyRotation + CGFloat(deltaRotation)) % 360))
    
    lastTimeStamp = displaylink.timestamp
    
    update()
  }
  
  private func update() {
    // timer runs out? gameState = .lose else ...
    if enemyCollisionDetected {
      magnitude = 1
      angle = .zero
      // force gesture to end
    }
    if goalCollisionDetected {
      gameState = .win // private(set)
    }
    
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

struct MEDecryptionMinigame: View {
  
  @StateObject var engine = MEMinigameEngine()
  
  var body: some View {
    VStack {
      Slider(value: $engine.magnitude)
      Slider(value: $engine.angle)
      Text("Refresh Rate \(engine.deltaTimeStamp) s")
      Text("Last Timestamp: \(engine.lastTimeStamp)").monospacedDigit()
      // DECRYPTION ARENA
      ZStack {
        Color.black.opacity(0.8)
        Circle().stroke() // outer border
        
        // Draw background circles
        ForEach(0...4, id: \.self) { index in
          Circle()
            .inset(by: CGFloat(index) * engine.ringWidth)
            .strokeBorder(lineWidth: engine.ringWidth)
            .foregroundColor(index % 2 == 0 ? Color.meFroggerBlue : Color.meFroggerMoreBluer)
        }
        
        engine.goal
          .foregroundColor(.meFroggerEvenMoreBluerer)
        engine.rotatedPlayer.path(in: engine.playerPosition)
          .foregroundColor(.meFroggerPlayer)
        engine.securityGroup.path(in: engine.arenaRect)
          .foregroundColor(.red)
        engine.boundaryGroup.path(in: engine.arenaRect)
          .foregroundColor(.orange)
        
        switch engine.gameState {
          case .start:
            EmptyView()
          case .win:
            resultView(win: true)
          case .fail:
            resultView(win: false)
        }
        
      }
      .frame(width: engine.arenaSize, height: engine.arenaSize)
      .border(Color.red)
      
      Spacer()
    }

  }
  
  func resultView(win: Bool) -> some View {
    let color: Color = win ? .meWinFroggerGreen : .red
    let text: String = win ? "Override Succeeded" : "Override Failed"
    return ZStack {
      Group {
        Ellipse()
          .frame(width: engine.arenaSize, height: 128)
          .blur(radius: 10)
          .foregroundColor(color.opacity(0.6))
        
        Ellipse()
          .frame(width: engine.arenaSize * 3/13, height: 128)
          .blur(radius: 20)
          .foregroundColor(color.opacity(0.7))
      }
      .mask(
        Rectangle()
          .frame(width: engine.arenaSize * 11/13, height: engine.arenaSize)
      )
      
      VStack(spacing: 0) {
        HorizontalLine().stroke(lineWidth: 2).foregroundColor(color)
        ZStack {
          
          Color.meFroggerGray
          Ellipse()
            .blur(radius: 5)
            .foregroundColor(.black)
            .frame(width: engine.arenaSize * 9/13, height: 32)
          Text(text)
            .font(.system(.title2))
            .bold()
            .foregroundColor(color)
        }
        
        HorizontalLine().stroke(lineWidth: 2).foregroundColor(color)
      }
      .frame(width: engine.arenaSize * 11/13, height: 36)
    }
    
  }
  
    
}

struct MEDecryptionMinigame_Previews: PreviewProvider {
  static var previews: some View {
    MEDecryptionMinigame()
  }
}
