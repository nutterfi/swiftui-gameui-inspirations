//
//  DeathStrandAnimation.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 1/1/22.
//

import SwiftUI
import Shapes

class DeathStrandAnimationViewModel: ObservableObject {
  @Published private(set) var data: [CGFloat]
  private var timer: Timer?
  private let dampingFactor = 0.0025
  var phase: CGFloat = .zero {
    didSet {
      data = Math.dampedOscillator(points: points, sampleRate: sampleRate, phase: phase, dampingFactor: dampingFactor)
    }
  }
  
  var points = 2000
  var sampleRate: CGFloat = 1000
  var deltaPhase = 0.001
  
  func shiftedData(by amount: Int) -> [CGFloat] {
    Math.dampedOscillator(points: points, sampleRate: sampleRate, phase: phase + CGFloat(amount) * 2 * .pi / sampleRate, dampingFactor: dampingFactor)
  }
  
  init() {
    data = Math.dampedOscillator(points: points, sampleRate: sampleRate, phase: phase, dampingFactor: dampingFactor)
    timer = Timer.scheduledTimer(withTimeInterval: 0.0167, repeats: true, block: { timer in
      self.phase = (self.phase + self.deltaPhase)
    })
    timer?.fire()
  }
}

struct DeathStrandAnimation: View {
  @StateObject private var viewModel = DeathStrandAnimationViewModel()
  var deathStrandingCyan = Color(red: 17/255, green: 197/255, blue: 205/255)
  var body: some View {
    ZStack {
      Color.black.ignoresSafeArea()
      HStack {
        DragonCurve(steps: 8, angleDegrees: 120)
          .stroke(Color.blue.opacity(0.3))
        DragonCurve(steps: 8, angleDegrees: 120)
          .stroke(Color.blue.opacity(0.3))
        
        DragonCurve(steps: 8, angleDegrees: 120)
          .stroke(Color.blue.opacity(0.3))
        DragonCurve(steps: 8, angleDegrees: 120)
          .stroke(Color.blue.opacity(0.3))
      }
      
      DataPath(data: viewModel.data)
        .stroke(lineWidth: 5)
        .foregroundColor(deathStrandingCyan)
        .blur(radius: 1)
        .frame(height: 64)
      DataPath(data: Array(viewModel.shiftedData(by: 100)))
        .stroke(lineWidth: 5)
        .foregroundColor(deathStrandingCyan)
        .shadow(color: .blue, radius: 10, x: 1, y: 1)
        .frame(height: 64)
      
      VStack {
        HStack {
          ZStack {
            Color.white
            Circle()
              .inset(by: 5)
              .foregroundColor(.black)
            StarPolygon(points: 5, density: 2)
              .inset(by: 5)
          }
          .frame(width:32, height: 32)
          
          Text("ORDERS")
            .font(.system(size: 40, weight: .medium, design: .serif))
        }
        Text("View active orders.")
      }
      .foregroundColor(.white)
      

    }
  }
}

struct BackgroundSelfBlur: ViewModifier {
  var blurRadius: CGFloat
  func body(content: Content) -> some View {
    content
      .background(content.blur(radius: blurRadius))
  }
  
}


struct DeathStrandAnimation_Previews: PreviewProvider {
  static var previews: some View {
    DeathStrandAnimation()
      .previewInterfaceOrientation(.landscapeLeft)
  }
}
