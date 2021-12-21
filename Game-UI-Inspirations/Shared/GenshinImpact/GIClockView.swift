//
//  GIClockView.swift
//  GIClockView
//
//  Created by nutterfi on 7/27/21.
//

import SwiftUI

struct GIClockView: View {
  // normalized rotation from 0 to 1
  var hourRotation: Double = 0
  var minuteRotation: Double = 0
  @State private var isAnimating = false
  
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          // outer
          Circle()
            .stroke(Color.yellow.opacity(0.2), lineWidth: 3)
            .frame(width: dim * 0.95, height: dim * 0.95)
          
          Circle()
            .stroke(Color.yellow.opacity(0.2), lineWidth: 3)
            .frame(width: dim * 0.75, height: dim * 0.75)
          
          StrokeStyledCircle(numberOfSegments: 120, segmentRatio: 0.8, lineWidthRatio: 0.05)
            .frame(width: dim * 0.55, height: dim * 0.55)
            .foregroundColor(Color.blue.opacity(0.2))
          
          // include the circles
          Circle()
            .fill(Color.white)
            .frame(width: dim * 0.05, height: 0.05 * dim)
            .offset(x: 0, y: -0.28 * dim)
          

          
          let grad = AngularGradient(colors: [Color.red, .orange, .yellow, .green, .blue, .purple], center: .center)
          // User-defined arc
          Circle()
            .trim(from: 0.1, to: 0.95)
            .stroke(grad, lineWidth: 5)
            .frame(width: dim * 0.5, height: dim * 0.5)
          
          // gears
          Group {
          
          Image(systemName: "gear")
            .resizable()
            .scaledToFit()
            .foregroundColor(.gray)
            .frame(width: dim * 0.5, height: dim * 0.5)
            .rotationEffect(.degrees(isAnimating ? -360 : 0))
            .offset(x: -dim * 0.1, y: 0)
            .animation(Animation.linear(duration: 3).repeatForever(autoreverses: false), value: isAnimating)
            
            Image(systemName: "gear")
              .resizable()
              .scaledToFit()
              .foregroundColor(.gray)
              .frame(width: dim * 0.25, height: dim * 0.25)
              .rotationEffect(.degrees(isAnimating ? 360 : 0))
              .offset(x: dim * 0.2, y: dim * 0.1)
              .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false), value: isAnimating)
          
          }
          .mask(Circle()
              .frame(width: dim * 0.5, height: dim * 0.5)
          )
          
          
          // clock hands
          Group {
            Color.white
              .frame(width: dim * 0.2, height: dim * 0.02)
              .rotationEffect(.degrees(360 * hourRotation), anchor: .leading)
              .offset(x: dim * 0.1, y: 0)
            
            Color.white
              .frame(width: dim * 0.15, height: dim * 0.01)
              .rotationEffect(.degrees(360 * minuteRotation), anchor: .leading)
              .offset(x: dim * 0.075, y: 0)
          }
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
      .onAppear {
        isAnimating = true
      }
    }
}

struct GIClockView_Previews: PreviewProvider {
    static var previews: some View {
      ZStack {
        Color.black.ignoresSafeArea()
        GIClockView(hourRotation: -0.05, minuteRotation: 0.1)
      }
    }
}
