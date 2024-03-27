//
//  EmitterView.swift
//  SpriteKitRules
//
//  Created by nutterfi on 1/25/22.
//

import SwiftUI
import Shapes
import Combine

class EmitterViewModel: ObservableObject {
  @Published var emitterProperties = EmitterViewProperties.sample
}

struct EmitterViewProperties {
  var particleBirthRate: CGFloat = 100
  var numParticlesToEmit: Int = 10
  var particleLifetime: CGFloat = 2.0
  var particleLifetimeRange: CGFloat = 0.0
  
  // MARK: - Position
  var particlePosition: CGPoint = .zero
  var particlePositionRange: CGVector = .zero
  var positionRange: CGSize = .zero
  var particleZPosition: CGFloat = .zero
  // particleZPositionRange is deprecated so we won't include
  
  var particleSpeed: CGFloat = .zero
  var particleSpeedRange: CGFloat = .zero
  var emissionAngle: CGFloat = .zero
  var emissionAngleRange: CGFloat = .zero
  var xAcceleration: CGFloat = .zero
  var yAcceleration: CGFloat = .zero
  
  // MARK: - Rotation
  var particleRotation: CGFloat = .zero
  var particleRotationRange: CGFloat = .zero
  var particleRotationSpeed: CGFloat = .zero // uniform for all particles in SpriteKit. WHy?
  
  // MARK: - Scale
  var particleScale: CGFloat = 1.0
  var particleScaleRange: CGFloat = .zero
  var particleScaleSpeed: CGFloat = .zero
  // particleSize will not be implemented since we are using Views and not image files
  
  // particleColorSequence used with SKKeyframeSequence, could we replace this with a .hueRotation animation?
  
  // MARK: - Color
  var particleColor: Color  = .white // we are using SwiftUI! in SKEmitterNode this is ignored if creating objects using particle editor, where particleColorSequence is used instead
  var particleColorAlphaRange: CGFloat = .zero
  var particleColorBlueRange: CGFloat = .zero
  var particleColorRedRange: CGFloat = .zero
  var particleColorGreenRange: CGFloat = .zero
  
  var particleColorAlphaSpeed: CGFloat = .zero
  var particleColorBlueSpeed: CGFloat = .zero
  var particleColorRedSpeed: CGFloat = .zero
  var particleColorGreenSpeed: CGFloat = .zero
  
  // particleColorBlendFactorSequence used with SKKeyframeSequence, could we replace this with a .hueRotation animation?
  
  var particleColorBlendFactor: CGFloat = .zero
  var particleColorBlendFactorRange: CGFloat = .zero
  var particleColorBlendFactorSpeed: CGFloat = .zero
  
  // var particleBlendMode: SKBlendMode { get set }
  var particleBlendMode: BlendMode = .plusLighter
  // var particleAlphaSequence: SKKeyframeSequence? { get set }
  
  var particleAlpha: CGFloat = 1.0
  var particleAlphaRange: CGFloat = .zero
  var particleAlphaSpeed: CGFloat = .zero
  
  var color: Color = .clear
  var amount: Int = 0
  var duration: CGFloat = 1
  var delay: CGFloat = 0
  var delayVariation: CGFloat = 0
}

extension EmitterViewProperties {
  static var sample: EmitterViewProperties {
    EmitterViewProperties(
      numParticlesToEmit: 200,
      particleScale: 0.3,
      particleScaleRange: 0.5,
      color: .blue,
      duration: 1,
      delay: 1,
      delayVariation: 1)
  }
}

struct EmitterView<T: View>: View {
  var texture: T
  @StateObject private var viewModel = EmitterViewModel()
  
  @State var timeInterval: TimeInterval = 0
  @State var maxTimeInterval: TimeInterval = 1.0
  
  @State private var animating = false
  
  //  var particles: [T] = []
  //
  //  init() {
  //    particles = Array(repeating: texture, count: viewModel.emitterProperties.numParticlesToEmit)
  //  }
  
  var menu: some View {
    VStack {
      HStack {
        Text("Scale")
        Slider(value: $viewModel.emitterProperties.particleScale)
      }
      HStack {
        Text("Scale Range")
        Slider(value: $viewModel.emitterProperties.particleScaleRange)
      }
      ColorPicker("Texture Color", selection: $viewModel.emitterProperties.particleColor)
      Spacer()
    }
  }
  
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      
      ZStack(alignment: .topLeading) {
        menu
        .foregroundColor(.white)
        .padding()
        .frame(width: proxy.size.width * 0.25, height: proxy.size.height)
        .zIndex(1000)
        .background(Color.gray.opacity(0.6))
        
        // any time a parameter changes, everything is getting redrawn, losing the previous properties
        let frameSize = 0.1 * viewModel.emitterProperties.particleScale
        
        
        ForEach(0..<viewModel.emitterProperties.numParticlesToEmit, id: \.self) {_ in
          let scaleVariation = CGFloat.random(in: -viewModel.emitterProperties.particleScaleRange*0.5...viewModel.emitterProperties.particleScaleRange*0.5)
          
          let x = CGFloat.random(in: 0...1)
          let y = CGFloat.random(in: 0...1)
          
          let delayVariation = CGFloat.random(
            in: -viewModel.emitterProperties.delayVariation ...
            viewModel.emitterProperties.delayVariation)
          
          texture
            .scaleEffect(frameSize + 0.1 * scaleVariation)
            .blendMode(viewModel.emitterProperties.particleBlendMode)
            .foregroundColor(viewModel.emitterProperties.particleColor)
            .colorMultiply(viewModel.emitterProperties.particleColor)
//            .offset(x: dim * (-0.5 + x) * timeInterval, y: dim * (-0.5 + y) * timeInterval)
//            .rotationEffect(.degrees(Double.random(in: 0...360)))
//            .opacity(1 - timeInterval/maxTimeInterval)
            .modifier(Motion(duration: timeInterval, useGravity: false))
//            .animation(
//              Animation.easeInOut(duration: timeInterval)
//                .delay(viewModel.emitterProperties.delay + delayVariation)
//                .repeatForever(autoreverses: false), value: timeInterval
//            )
        }
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
//      .onAppear {
//        maxTimeInterval = viewModel.emitterProperties.duration
//        timeInterval = viewModel.emitterProperties.duration
//      }
      
    }
  }
  
//  var animatableData: CGFloat {
//    get {
//      timeInterval
//    }
//    set {
//      timeInterval = newValue
//    }
//  }
}

struct EmitterView_Previews: PreviewProvider {
  static var previews: some View {
    EmitterView(texture: Salinon())
      .background(Color.black)
      .previewInterfaceOrientation(.landscapeLeft)
  }
}
