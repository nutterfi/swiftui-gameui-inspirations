//
//  OW2FindingGameAnimation.swift
//  Game-UI-Inspirations (iOS)
//
//  Created by nutterfi on 10/4/22.
//

import SwiftUI

// TODO: Fix sync of the orange segment appearing
struct OW2FindingGameAnimation: View {
  @State private var isAnimating = false
    var body: some View {
      ZStack {
        LinearGradient(colors: [.ow2BackgroundBlue, .ow2BackgroundBlue2, .ow2BackgroundBlue], startPoint: .bottomLeading, endPoint: .topTrailing)
          .ignoresSafeArea()
        GeometryReader { proxy in
          let dim = min(proxy.size.width, proxy.size.height)
          ZStack {
            
            OverwatchIcon(primary: Color.ow2IconDarkGray, secondary: Color.ow2IconDarkGray)
            
            Circle()
              .trim(from: 0, to: 0.5)
              .stroke(lineWidth: dim * 0.15)
              .rotation(isAnimating ? .degrees(360 ) : .zero)
              .frame(width: dim * 0.85)
              .clipShape(
                Circle()
                  .trim(from: 0.76, to: 0.99)
                  .rotation(.degrees(-45))
                  .stroke(lineWidth: dim * 0.15)
              )
              .foregroundStyle(Color.ow2Orange)
              .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false), value: isAnimating)
            
            Circle()
              .trim(from: 0.76, to: 0.99)
              .rotation(.degrees(-45))
              .stroke(lineWidth: dim * 0.03)
              .scale(1.1)
              .rotation(isAnimating ? .degrees(360 ) : .zero)
              .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false), value: isAnimating)
              .foregroundStyle(Color.ow2Orange)
            
            Circle()
              .trim(from: 0, to: 0.75)
              .rotation(.degrees(-45))
              .stroke(lineWidth: dim * 0.01)
              .scale(1.3)
              .rotation(isAnimating ? .degrees(-360 ) : .zero)
              .animation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: false), value: isAnimating)
              .foregroundStyle(Color.ow2IconLightGray)

          }
          .scaleEffect(0.7)

          .frame(width: proxy.size.width, height: proxy.size.height)
        }
//        .padding(50) // TODO: Fix padding
        .task {
          isAnimating.toggle()
      }
      }
      
    }
}

struct OW2FindingGameAnimation_Previews: PreviewProvider {
    static var previews: some View {
        OW2FindingGameAnimation()
        .previewLayout(.fixed(width: 1000, height: 300))
    }
}
