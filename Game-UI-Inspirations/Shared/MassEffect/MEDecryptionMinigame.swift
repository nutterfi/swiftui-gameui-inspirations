import SwiftUI
import Shapes

//  MARK: -  Game Engine

/// Game Engine
class MEMinigameEngine: ObservableObject {
  /// Rotation in degrees
  @Published private(set) var enemyRotation: CGFloat = .zero
    
  @Published private(set) var gameTimeRemaining: TimeInterval = gameTimerDuration

  /// #MARK -- Player
  /// The player position in polar coordinates - User Input
  @Published var magnitude: CGFloat = 1
  @Published var angle: CGFloat = 0
  
  enum GameState {
    case idle // the game has finished loading
    case start // the game has started
    case fail // the player has failed the game
    case win // the player has won the game
  }
  
  @Published private(set) var gameState: GameState = .idle

  private var displayLink: CADisplayLink?
  private var deltaTimeStamp: TimeInterval = .zero
  private var lastTimeStamp: TimeInterval = CACurrentMediaTime()
  
  private static let enemyRotationSpeed = 360.0/5
  static let gameTimerDuration: CGFloat = 15.0

  /// square size inferred (512x512)
  let arenaSize: CGFloat = 512
  let playerSize: CGFloat = 32
  
  init() {
    createDisplayLink()
  }
  
  deinit {
    displayLink?.invalidate()
  }
  
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
  
  var ringWidth: CGFloat { arenaSize / 13 }
  
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
  
  //  MARK: - Game Tick
  
  private func createDisplayLink() {
    displayLink = CADisplayLink(target: self, selector: #selector(step))
    displayLink?.add(to: .current, forMode: .default)
  }
  
  @objc private func step(displaylink: CADisplayLink) {
    deltaTimeStamp = displaylink.timestamp - lastTimeStamp
    lastTimeStamp = displaylink.timestamp
    update()
  }
  
  private func update() {
    switch gameState {
      case .idle:
        gameState = .start
      case .start:
        let deltaRotation = deltaTimeStamp * MEMinigameEngine.enemyRotationSpeed
        enemyRotation = CGFloat((Int(enemyRotation + CGFloat(deltaRotation)) % 360))
        
        gameTimeRemaining -= deltaTimeStamp
        if gameTimeRemaining <= 0 {
          gameState = .fail
        } else if goalCollisionDetected {
          gameState = .win
        } else if enemyCollisionDetected {
          magnitude = 1
          angle = .zero
          // TODOF: force gesture to end
        }
        
      case .win, .fail:
        gameTimeRemaining = MEMinigameEngine.gameTimerDuration // reset the game timer
    }
    
  }
}

// MARK: - VIEW

struct MEDecryptionMinigame: View {
  
  @StateObject var engine = MEMinigameEngine()
  @GestureState private var magnifyBy = 1.0

  var rotation: some Gesture {
    RotationGesture()
      .onChanged { angle in
        engine.angle = angle.degrees
      }
  }

  var magnification: some Gesture {
    MagnificationGesture()
      .updating($magnifyBy) { currentState, gestureState, transaction in
        gestureState = currentState
      }
  }

  func controlsView() -> some View {
    VStack {
      Slider(value: $engine.magnitude)
      Slider(value: $engine.angle)
    }
  }
  
  var body: some View {
    VStack {
      controlsView()
      gameView()
      .frame(width: engine.arenaSize, height: engine.arenaSize)
      
      Spacer()
    }
    .gesture(magnification)
    .gesture(rotation)
    .onChange(of: magnifyBy) { newValue in
      engine.magnitude *= newValue
    }
  }
  
  // DECRYPTION ARENA
  fileprivate func gameView() -> some View {
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
          timerView
        case .win:
          resultView(win: true)
        case .fail:
          resultView(win: false)
        case .idle:
          EmptyView()
      }
    }
  }
  
  var timerView: some View {
    ZStack {
      Color.black
      Text("\(String(format: "%.02f", engine.gameTimeRemaining))")
        .bold()
        .foregroundColor(.white)
    }
    .frame(height: 36)
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
