//
//  DrStrangeShield.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 12/28/21.
//

import SwiftUI
import Shapes

struct DrStrangeShieldDemo: View {
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        Color.black.ignoresSafeArea()
        DrStrangeShield()
          .frame(width: dim, height: dim)
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct DrStrangeShield: View {
  @State private var isAnimating = false
  var runicText = "ᚠᚡᚣᚬᚸ ᛒᛓᛥ ᛠᛢ"
  
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        
        let rg = RadialGradient(colors: [.white, .yellow, .orange], center: .center, startRadius: .zero, endRadius: dim)
        
        ZStack {
          ZStack {
          CircularText(text: runicText, size: 40)
            .frame(width: dim, height: dim)
          
          Circle()
            .strokeBorder(lineWidth: dim * 0.01)
            .frame(width: dim * 0.95, height: dim * 0.95)
          
          CirclePattern(pattern: Reuleaux.triangle, repetitions: 30)
            .frame(width: dim * 0.85, height: dim * 0.85)

          }
          .rotationEffect(.degrees(isAnimating ? 360 : 0))
          .animation(Animation.linear(duration: 15).repeatForever(autoreverses: false), value: isAnimating)
          
          Circle()
            .strokeBorder(lineWidth: dim * 0.01)
            .frame(width: dim * 0.88, height: dim * 0.88)
          
//          Circle()
//            .strokeBorder(lineWidth: dim * 0.01)
//            .frame(width: dim * 0.78, height: dim * 0.78)
//
//          Circle()
//            .strokeBorder(lineWidth: dim * 0.01)
//            .frame(width: dim * 0.75, height: dim * 0.75)
          
          let strokeStyleDashPhase = StrokeStyle(
            lineWidth: isAnimating ? 10 : 2,
            lineCap: isAnimating ? .butt : .square,
            lineJoin: isAnimating ? .round : .bevel,
            miterLimit: isAnimating ? 10 : 0,
            dash: [20, 10, 5],
            dashPhase: isAnimating ? 105 : 0
          )
          
          Circle()
            .stroke(style: strokeStyleDashPhase)
            .stroke(style: strokeStyleDashPhase)
            .stroke(lineWidth: 2)
            .animation(
              Animation.linear(duration: 5).repeatForever(autoreverses: false),
              value: isAnimating
            )
            .frame(width: dim * 0.75, height: dim * 0.75)
          
          Group {
            Circle()
              .stroke(lineWidth: dim * 0.01)
            ConvexPolygon(sides: 8)
              .stroke(lineWidth: dim * 0.01)
            StarPolygon(points: 8, density: 2)
              .stroke(lineWidth: dim * 0.02)
          }
          .rotationEffect(.degrees(isAnimating ? 0 : 360))
          .animation(Animation.easeInOut(duration: 3).repeatForever(), value: isAnimating)
          .blur(radius: 2)
          .frame(width: dim * 0.7, height: dim * 0.7)
          
          Circle()
            .stroke(lineWidth: dim * 0.01)
            .frame(width: dim * 0.4, height: dim * 0.4)
          
          Group {
            Circle()
              .stroke(lineWidth: dim * 0.01)
            
            StarPolygon(points: 8, density: 3)
              .stroke(lineWidth: dim * 0.02)
          }
          .blur(radius: 1.5)
          .frame(width: dim * 0.3, height: dim * 0.3)
          .animation(Animation.easeInOut(duration: 2).repeatForever(), value: isAnimating)
        }
        .foregroundStyle(rg)
        .mask({
          RadialGradient(colors: [.clear, .black], center: .topLeading, startRadius: 0, endRadius: dim)
        })
        .animation(Animation.easeInOut(duration: 2).repeatForever(), value: isAnimating)
        .frame(width: proxy.size.width, height: proxy.size.height)
        .onAppear {
          isAnimating.toggle()
        }
        
      }
    }
}

struct DrStrangeShield_Previews: PreviewProvider {
    static var previews: some View {
      DrStrangeShieldDemo()
    }
}
