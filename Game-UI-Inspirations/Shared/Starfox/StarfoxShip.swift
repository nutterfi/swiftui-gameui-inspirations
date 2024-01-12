//
//  StarfoxShip.swift
//  Game-UI-Inspirations (iOS)
//
//  Created by nutterfi on 1/11/24.
//

import SwiftUI
import Shapes

struct StarfoxShip: View {
  
  var body: some View {
    ZStack {
      hull
        .frame(width: 128, height: 480)
      
      // left wing
      RightTriangle()
        .rotation(.degrees(-30))
        .offset(x: -180, y: 200)
        .fill(.gray)
        .stroke(.black)
        .frame(width: 300, height: 64)
      
      RightTriangle()
        .scale(x: -1)
        .rotation(.degrees(30))
        .offset(x: 180, y: 200)
        .fill(.gray)
        .stroke(.black)
        .frame(width: 300, height: 64)
      
      // Blue vertical wings
      
      Kite(pointRatio: 0.5)
        .rotation(.degrees(15))
        .offset(x: -80, y: 150)
        .fill(.blue)
        .stroke(.black)
        .frame(width: 48, height: 225)
      
      Kite(pointRatio: 0.5)
        .rotation(.degrees(-15))
        .offset(x: 80, y: 150)
        .fill(.blue)
        .stroke(.black)
        .frame(width: 48, height: 225)
    }
  }
  
  
  var hull: some View {
    GeometryReader { proxy in
      ZStack {
        Kite(pointRatio: 0.8)
          .foregroundStyle(Color.gray)
        
          .overlay {
            VerticalLine().stroke()
          }
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

enum AnimationPhase: CaseIterable {
  case spawn
  case despawn
  case reset
  
  var verticalOffset: Double {
    switch self {
    case .spawn, .reset:
        return 0
    case .despawn:
        return -1000
    }
  }
  
  var opacity: Double {
    switch self {
    case .spawn:
        return 1
    case .despawn, .reset:
        return 0
    }
  }
  
}

struct StarfoxDemo: View {
  @State private var rotation: Double = 0
  @State private var isAnimating: Bool = false
  
  @State private var animation: Animation = .linear(duration: 0.2)
  
  var body: some View {
    ZStack {
      Color.blue.opacity(0.2).ignoresSafeArea()
      VStack {
        Slider(value: $rotation, in: 0...180)
        
        StarfoxShip()
          .rotation3DEffect(
            .degrees(rotation),
            axis: (x: 1.0, y: 0.0, z: 0.0)
          )
          .frame(square: 200)
        
        Color.clear.frame(height: 20)
      }
      .padding()
      
      // bullets
      Kite(pointRatio: 0.2)
//        .offset(isAnimating ? .init(x: 0, y: -1000) : .zero)
        .fill(Color.blue)
//        .animation(animation, value: isAnimating)
//        .opacity(isAnimating ? 1 : 0)
//        .animation(nil, value: isAnimating)
        .phaseAnimator(AnimationPhase.allCases, trigger: isAnimating) { content, value in
          content
            .offset(y: value.verticalOffset)
            .opacity(value.opacity)
        } animation: { _ in
            .linear(duration: 0.2)
        }
        .frame(width: 50, height: 150)
        .rotation3DEffect(
          .degrees(rotation),
          axis: (x: 1.0, y: 0.0, z: 0.0),
          perspective: 0.2
        )
        .zIndex(-1)
      
      
    }
    .contentShape(Rectangle())
    .onTapGesture {
      Task {
        DispatchQueue.main.async {
                   isAnimating.toggle()
                 }
      }
      withAnimation {
//        Task {
//          DispatchQueue.main.async {
//            isAnimating.toggle()
//          }
//        }
      }
    }
  }
}

#Preview {
  StarfoxDemo()
}
