//
//  SpiderManSkillLoadingView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 12/18/21.
//

import SwiftUI
import Shapes

struct SpiderManSkillLoadingView: View {
  @State private var isAnimating: Bool = false
  
  var diagonalLines: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        Parallelogram(pct: 0.9)
          .frame(width: dim * 0.85, height: dim * 0.85)
          .offset(x: isAnimating
                  ? dim * 0.25
                  : -dim * 0.25,
                  y: isAnimating
                  ? -dim * 0.25
                  : dim * 0.25)
          .animation(
          Animation.linear(duration: 2)
            .repeatForever(),
          value: isAnimating
        )
        
        Parallelogram(pct: 0.9)
          .frame(width: dim * 0.35, height: dim * 0.35)
          .offset(x: isAnimating
                  ? -dim * 0.25 + dim * 0.1
                  : dim * 0.25 + dim * 0.1,
                  y: isAnimating
                  ? dim * 0.25 + dim * 0.1
                  : -dim * 0.25 + dim * 0.1)
          .animation(
            Animation.linear(duration: 2.5)
              .delay(0.0)
              .repeatForever(),
            value: isAnimating
          )
        
        Parallelogram(pct: 0.9)
          .frame(width: dim * 0.35, height: dim * 0.35)
          .offset(x: isAnimating
                  ? dim * 0.25 + dim * 0.05
                  : -dim * 0.25 + dim * 0.05,
                  y: isAnimating
                  ? -dim * 0.25 + dim * 0.05
                  : dim * 0.25 + dim * 0.05)
          .animation(
            Animation.linear(duration: 2)
              .delay(0.0)
            .repeatForever(),
          value: isAnimating
        )
        
          // above center line
        Parallelogram(pct: 0.9)
          .frame(width: dim * 0.35, height: dim * 0.35)
          .offset(x: isAnimating
                  ? -dim * 0.25 + dim * 0.2
                  : dim * 0.25 + dim * 0.2,
                  y: isAnimating
                  ? dim * 0.25 - dim * 0.2
                  : -dim * 0.25 - dim * 0.2)
          .animation(
            Animation.linear(duration: 2.5)
              .delay(0.0)
              .repeatForever(),
            value: isAnimating
          )
        
        Parallelogram(pct: 0.9)
          .frame(width: dim * 0.45, height: dim * 0.45)
          .offset(x: isAnimating
                  ? -dim * 0.25 + dim * 0.3
                  : dim * 0.25 + dim * 0.3,
                  y: isAnimating
                  ? dim * 0.25 - dim * 0.3
                  : -dim * 0.25 - dim * 0.3)
          .animation(
            Animation.linear(duration: 2)
              .delay(0)
              .repeatForever(),
            value: isAnimating
          )
        
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
  
  var rotatingRing: some View {
    ZStack {
      StrokeStyledCircle(
        numberOfSegments: 4,
        segmentRatio: 0.45,
        lineWidthRatio: 0.02
      )
      
      StrokeStyledCircle(
        numberOfSegments: 4,
        segmentRatio: 0.04,
        lineWidthRatio: 0.01,
        dashPhaseRatio: 0.3
      )
    }
  }
  
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        rotatingRing
          .frame(width: dim * 0.75, height: dim * 0.75)
          .rotationEffect(.degrees(isAnimating ? 360 : 0))
          .animation(
            Animation.linear(duration: 10)
              .repeatForever(autoreverses: false),
            value: isAnimating
          )
        
        Spider()
          .fill(Color.red)
          .frame(width: dim * 0.8, height: dim * 0.8)
          .scaleEffect(isAnimating ? 1.2 : 1.0)
          .animation(
            Animation.linear(duration: 2)
              .repeatForever(),
                  
            value: isAnimating
          )
        
        diagonalLines
          .frame(width: dim * 0.75, height: dim * 0.75)
        
      }
      .foregroundColor(.red)
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
    .onAppear {
      isAnimating = true
    }
  }
}

struct SpiderManSkillLoadingView_Previews: PreviewProvider {
  static var previews: some View {
    SpiderManSkillLoadingView()
    .frame(width: 512, height: 512)
    .border(Color.purple)
  }
}
