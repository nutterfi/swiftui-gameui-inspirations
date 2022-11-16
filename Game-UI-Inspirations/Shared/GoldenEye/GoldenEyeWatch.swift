//
//  GoldenEyeWatch.swift
//  Game-UI-Inspirations (iOS)
//
//  Created by nutterfi on 10/8/22.
//

import SwiftUI
import Shapes

struct GoldenEyeWatchDemo: View {
  @State private var health : Float = 1.0
  @State private var shield : Float = 1.0
  @State private var isAnimating = false
  
  var controls: some View {
    VStack {
      HStack {
        Text("Health")
        Slider(value: $health)
      }
      
      HStack {
        Text("Shield")
        Slider(value: $shield)
      }
      Button("Animate") {
        isAnimating.toggle()
      }
    }
    .padding()
  }
  
  var body: some View {
    VStack {
      controls
      GoldenEyeWatch(health: $health, shield: $shield, isAnimating: $isAnimating)
    }
    .task {
      isAnimating.toggle()
    }
  }
}

struct GoldenEyeWatch: View {
  @Binding var health : Float
  @Binding var shield : Float
  @Binding var isAnimating: Bool
  
  func meter(fill: CGFloat = 1.0) -> some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        StrokeStyledCircle(
          numberOfSegments: 3,
          dashPattern: [
            10, 10,
            10, 10,
            10, 10,
            10, 10,
            10, 10,
            30, 10,
            30, 10,
            30, 10
          ],
          lineWidthRatio: 0.1,
          trim: (0, fill * 99/300)
        )
        .rotation(.degrees(125))
        .frame(width: dim * 0.9)
        
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
    
  }
  
  var hud: some View {
    VStack {
      Group {
        Text("Q WATCH v2.01 BETA")
        
        HStack {
          Text("MISSION STATUS")
          Text("INCOMPLETE")
        }
        HStack {
          Text("ABORT:")
          Text("CANCEL")
          Text("CONFIRM")
        }
      }
      .scaleEffect(x: 1, y: 0.5)
      
      Image(systemName: "hand.point.left.fill")
        .resizable()
        .scaledToFit()
        .frame(width: 100, height: 100)
      
      // tab bar
      HStack {
        ForEach(0..<5, id: \.self) { _ in
          Rectangle()
            .frame(width: 30, height: 10)
        }
      }
    }
    .foregroundColor(.green)
  }
  
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        Color.black//.ignoresSafeArea()
        
        
        Clock()
          .scaleEffect(x: 0.8, y : 0.8)
          .foregroundColor(.white)
        
        // Hour tick marks
        StrokeStyledCircle(
          numberOfSegments: 12,
          dashPattern: [1, 10],
          lineWidthRatio: 0.18
        )
        .foregroundColor(.white)
        .overlay(
          Circle()
            .inset(by: dim * 0.1)
            .stroke(lineWidth: dim * 0.1)
            .foregroundStyle(.black)
        )
        
        // Second tick marks
        StrokeStyledCircle(
          numberOfSegments: 60,
          dashPattern: [0.1, 0.9],
          lineWidth: 2,
          lineCap: .round
        )
        .inset(by: 0.1 * dim)
        .foregroundColor(.white)
        
        // Health
        meter(fill: 1)
          .foregroundColor(.black)
          .overlay(
            Group {
              meter()
                .opacity(0.3)
              meter(fill: CGFloat(health))
            }
              .foregroundStyle(LinearGradient(colors: [.yellow, .orange, .red], startPoint: .bottom, endPoint: .top))
          )
        
        // Shield
        meter(fill: 1)
          .foregroundColor(.black)
          .overlay(
            Group {
              meter()
                .opacity(0.3)
              meter(fill: CGFloat(shield))
            }
              .foregroundStyle(LinearGradient(colors: [.ow2BackgroundBlue, .ow2BackgroundBlue, .blue], startPoint: .bottom, endPoint: .top))
          )
          .scaleEffect(x: -1)

        
        // Green HUD
        Circle()
          .frame(width: dim * 0.65, height: dim * 0.65)
          .foregroundStyle(
            LinearGradient(
              colors: [
                .green.opacity(0.3),
                .green.opacity(0.25)
              ],
              startPoint:
                UnitPoint(x: 0.5, y: 0.8),
              endPoint: UnitPoint(x: 0.5, y: 0.1)
            )
          )
          .mask {
            Rectangle()
              .frame(height: dim * 0.5)
          }
          .overlay(hud)
          .scaleEffect(x: isAnimating ? 1 : 0.5, y: isAnimating ? 1 : 0)
          .animation(.linear(duration: 0.5), value: isAnimating)
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct GoldenEyeWatch_Previews: PreviewProvider {
  static var previews: some View {
    GoldenEyeWatchDemo()
  }
}
