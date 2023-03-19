import Foundation
import SwiftUI
import Shapes

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
    case collision // the game has detected a collision
    case fail // the player has failed the game
    case win // the player has won the game
  }
  
  @Published private(set) var gameState: GameState = .idle

  private var displayLink: CADisplayLink?
  private var deltaTimeStamp: TimeInterval = .zero
  private var lastTimeStamp: TimeInterval = CACurrentMediaTime()
  
  private static let enemyRotationSpeed = 360.0/5
  static let gameTimerDuration: CGFloat = 150.0

  /// square size inferred (512x512)
  let arenaSize: CGFloat = 512
  let playerSize: CGFloat = 32
  
  init() {
    createDisplayLink()
  }
  
  deinit {
    displayLink?.invalidate()
  }
  
  func gestureFinished() {
    if gameState == .collision {
      gameState = .start
    }
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
      case .start, .collision:
        let deltaRotation = deltaTimeStamp * MEMinigameEngine.enemyRotationSpeed
        enemyRotation = CGFloat((Int(enemyRotation + CGFloat(deltaRotation)) % 360))
        
        gameTimeRemaining -= deltaTimeStamp
        if gameTimeRemaining <= 0 {
          gameState = .fail
        } else if goalCollisionDetected {
//          gameState = .win
        } else if enemyCollisionDetected {
          magnitude = 1
          angle = .zero
          gameState = .collision
        }
        
      case .win, .fail:
        gameTimeRemaining = MEMinigameEngine.gameTimerDuration // reset the game timer
    }
    
  }
}
