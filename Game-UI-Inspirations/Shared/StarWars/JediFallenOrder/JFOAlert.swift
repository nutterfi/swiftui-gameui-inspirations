//
//  JFOAlert.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 1/14/23.
//

import SwiftUI

struct HorizontalLine: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.move(to: .init(x: rect.minX, y: rect.midY))
      path.addLine(to: .init(x: rect.maxX, y: rect.midY))
    }
  }
}

struct VerticalLine: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.move(to: .init(x: rect.midX, y: rect.minY))
      path.addLine(to: .init(x: rect.midX, y: rect.maxY))
    }
  }
}

extension Color {
  static let jfoCopper = Color(red: 137/255, green: 101/255, blue: 90/255)
}

extension CGSize {
  static func *(lhs: CGSize, rhs: CGFloat) -> CGSize {
    CGSize(width: lhs.width * rhs, height: lhs.height * rhs)
  }
}

let jfoGradient = AngularGradient(colors: [.black, .jfoCopper, .white, .jfoCopper, .white, .jfoCopper, .black], center: .center)

struct JFOAlert: View {
  @State private var isAnimating = false
  @State private var isVisible = true
  
  let animationDuration: CGFloat = 8.0
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          // Outer circle
          Circle()
            .inset(by: dim * 0.075)
            .trim(from: 0, to: 0.55)
            .rotation(.degrees(isAnimating ? 15 : 360 + 16))
            .stroke(jfoGradient)
            .animation(.easeOut(duration: 6), value: isAnimating)
          // Middle circle animates in
          Circle()
            .scale(isAnimating ? 0.7 : 1.1)
            .stroke(jfoGradient, lineWidth: 5)
            .animation(.linear(duration: 0.25).delay(1.5), value: isAnimating)
            .rotationEffect(.degrees(isAnimating ? -0 : -360))
            .animation(.easeOut(duration: 6), value: isAnimating)
            .opacity(isAnimating ? 1.0 : 0.0)
            .animation(.linear(duration: 0.5).delay(1.5), value: isAnimating)
          
          // Inner Circle
          Circle()
            .inset(by: dim * 0.22)
            .trim(from: 0, to: 0.5)
            .rotation(.degrees(isAnimating ? -90 : -360))
            .stroke(jfoGradient)
            .animation(.easeOut(duration: 6), value: isAnimating)
          
          // "Rotating Balance Beam" with a vertical stick on left side and a ball on right side.
          // the ball is positioned inline with the middle circle stroke
          ZStack {
            HorizontalLine()
              .scale(0.9)
              .stroke(Color.jfoCopper)
            
            VerticalLine()
              .scale(0.1)
              .offset(x: -dim * 0.52)
              .stroke(Color.jfoCopper)
            
            Circle()
              .scale(0.07)
              .overlay(
                Circle()
                  .scale(0.07)
                  .stroke(jfoGradient)
              )
              .offset(x: dim * 0.35)
              .foregroundColor(Color.jfoCopper.opacity(0.9))
          }
          .rotationEffect(.degrees(isAnimating ? -45 : 45))
          .animation(.easeOut(duration: animationDuration), value: isAnimating)
          // Vertical Balance Beam
          // vertical offset animation
          ZStack {
            VerticalLine()
              .scale(1.1)
              .stroke(Color.jfoCopper)
            
            Group {
              Circle()
                .scale(0.3)
                .stroke(Color.jfoCopper)
              Circle()
                .scale(0.07)
                .fill(Color.jfoCopper)
              Circle()
                .scale(0.07)
                .stroke(Color.jfoCopper)
            }
            .offset(y: dim * -0.3)
            
            Group {
              Circle()
                .scale(0.15)
                .stroke(Color.jfoCopper)
              Circle()
                .scale(0.07)
                .fill(Color.jfoCopper)
              Circle()
                .scale(0.07)
                .stroke(Color.jfoCopper)
            }
            .offset(y: dim * 0.475)
            
            
          }
          .offset(y: isAnimating ? dim * -0.05 : dim * 0.1)
          .animation(.easeOut(duration: 2), value: isAnimating)
          
          // Banner
          VStack(spacing: 5) {
            HStack(spacing: 10) {
              Circle().frame(width: dim * 0.02)
              HorizontalLine().stroke()
                .frame(height: 1)
              Circle().frame(width: dim * 0.02)
            }
            .foregroundColor(Color.jfoCopper)
            Group {
              Text("NEW EMITTER ACQUIRED")
                .font(.headline)
              Text("ENO CORDOVA")
                .font(.subheadline)
            }
            .foregroundColor(.white)
            
            HStack(spacing: 10) {
              Circle().frame(width: dim * 0.02)
              HorizontalLine().stroke()
                .frame(height: 1)
              Circle().frame(width: dim * 0.02)
            }
            .foregroundColor(Color.jfoCopper)
            
          }
          .opacity(isAnimating ? 1.0 : 0.0)
          .animation(.linear(duration: 1).delay(1), value: isAnimating)
          .padding(.horizontal, isAnimating ? 20 : 50)
          .animation(.easeOut(duration: 2).delay(1), value: isAnimating)
        }
        .opacity(isAnimating ? 1.0 : 0.0)
        .animation(.linear(duration: 1).delay(1), value: isAnimating)
        .clipShape(Rectangle())
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
      .opacity(isVisible ? 1 : 0)
      .animation(.linear(duration: 0.5), value: isVisible)
      .task {
        isAnimating = true
        try? await Task.sleep(nanoseconds: UInt64(animationDuration) * NSEC_PER_SEC)
        isVisible = false
      }
    }
}

struct JFOAlert_Previews: PreviewProvider {
    static var previews: some View {
      VStack {
        Color.clear.frame(height: 100)
        JFOAlert()
          .frame(width: 670/2, height: 500/2)
        Spacer()
      }
      .background(Color.black.opacity(0.95))
      .previewLayout(.sizeThatFits)
    }
}
