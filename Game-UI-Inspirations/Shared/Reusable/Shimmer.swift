//
//  Shimmer.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 3/31/22.
//

import SwiftUI

/// linear shimmer animation effect
struct Shimmer: View {
  @State private var animating = false
  var duration: Double = 1
  var delay: Double = 2
  
  var leading: Angle = .zero
  
  /// leading, trailing (FIXME: Only looks good if trajectory is polar opposite
  var trajectory: (UnitPoint, UnitPoint) = (.topLeading, .bottomTrailing)
  
    var body: some View {
      GeometryReader { proxy in
        let dim: CGFloat = min(proxy.size.width, proxy.size.height)
        
        let leading: CGSize = CGSize(width: -dim + trajectory.0.x * 2 * dim, height: -dim + trajectory.0.y * 2 * dim)
        let trailing: CGSize = CGSize(width: -dim + trajectory.1.x * 2 * dim, height: -dim + trajectory.1.y * 2 * dim)
        
        let grad = LinearGradient(colors: [.clear, .clear, .clear, .white, .clear, .clear, .clear], startPoint: trajectory.0, endPoint: trajectory.1)
//
        let shimmer = Color.white
          .frame(height: dim * 0.9)
          .blur(radius: 10)
        // TODO: This seems to be the best solution without a linear gradient (because I don't want the dark portion of the outside
        
        ZStack {
          grad
//             .opacity(0.1)
            .offset(animating ? trailing : leading)
            .scaleEffect(2)
            .animation(
              Animation
                .linear(duration: duration)
                .delay(delay)
                .repeatForever(autoreverses: false),
              value: animating
            )
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
        .onAppear {
          animating = true
        }
      }
    }
}

struct Shimmer_Previews: PreviewProvider {
    static var previews: some View {
      ZStack {
        Color.black.ignoresSafeArea()

        Destiny2FastTravelIcon(color: .red)
          .shimmer(duration: 2, delay: 1, trajectory: (.topLeading, .bottomTrailing))

        .frame(width: 256, height: 256)
      }
    }
}
