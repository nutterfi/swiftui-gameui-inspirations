import SwiftUI
import Shapes

struct MEDecryptionMinigame: View {
  
  @StateObject var engine = MEMinigameEngine()
  @GestureState private var magnifyBy = 1.0

  var rotation: some Gesture {
    RotationGesture()
      .onChanged { angle in
        guard engine.gameState == .start else { return }
        engine.angle = angle.degrees
      }
      .onEnded { value in
        engine.gestureFinished()
      }
  }

  var magnification: some Gesture {
    MagnificationGesture()
      .updating($magnifyBy) { currentState, gestureState, transaction in
        
//        guard engine.gameState == .start else { return }
        gestureState = currentState
      }
      .onEnded { value in
        engine.gestureFinished()
      }
  }

  func controlsView() -> some View {
    VStack {
      Slider(value: $engine.magnitude)
        .disabled(engine.gameState != .start)
      Slider(value: $engine.angle)
        .disabled(engine.gameState != .start)
      Text("\(magnifyBy)")
    }
  }
  
  var body: some View {
    GeometryReader { proxy in
      ZStack {
        Color.red.ignoresSafeArea()
        VStack {
          controlsView()
          gameView()
          .frame(width: engine.arenaSize, height: engine.arenaSize)
          
          Spacer()
        }
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
    .gesture(magnification)
    .gesture(rotation)
    .onChange(of: magnifyBy) { _, newValue in
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
        case .collision:
          EmptyView()
      }
    }
  }
  
  var timerView: some View {
    ZStack {
      Color.black
      Text("\(String(format: "%.02f", engine.gameTimeRemaining))")
        .font(.system(size: 28))
        .bold()
        .monospacedDigit()
        .foregroundColor(.white)
        .fixedSize()
    }
    .frame(width: engine.arenaSize * 2.0/13, height: 36)
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
