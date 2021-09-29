//
//  DBHTitleScreenMenuItem.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 9/21/21.
//

import SwiftUI
import Shapes

struct DBHTitleScreenMenu: View {
  @State private var isAnimating: Bool = false
  @State private var selectedIndex: Int = 0
  @State private var titles: [String] = ["New Game", "Continue", "Options", "Gallery"]
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          Color.black.ignoresSafeArea()
          
          let gradient = RadialGradient(colors: [.white.opacity(0.7), .blue.opacity(0.7)], center: .center, startRadius: dim / 10, endRadius: dim )
          
          Group {
          SimplePolygon(ratios: [0.1, 0.5, 0.756, 0.3, 0.4])
            .fill(gradient)
            .rotationEffect(.degrees(isAnimating ? 50 : 0))
            .animation(Animation.easeInOut(duration: 4).repeatForever(), value: isAnimating)
          SimplePolygon(ratios: [0.2, 0.35, 0.61, 0.9])
            .fill(gradient)

            .rotationEffect(.degrees(isAnimating ? 103 : 0))
            .animation(Animation.easeInOut(duration: 4).repeatForever(), value: isAnimating)
          SimplePolygon(ratios: [0.1, 0.4, 0.7])
            .fill(gradient)

            .rotationEffect(.degrees(isAnimating ? -180 : 180))
            .animation(Animation.easeInOut(duration: 4).repeatForever(), value: isAnimating)
          SimplePolygon(ratios: [0.2, 0.3, 0.48, 0.25, 0.8])
            .fill(gradient)

            .rotationEffect(.degrees(isAnimating ? 180 : -180))
            .animation(Animation.easeInOut(duration: 4).repeatForever(), value: isAnimating)
          }
          .scaleEffect(3.5)
          
          VStack(spacing: dim * 0.1) {
            
            ForEach(0...3, id:\.self) { index in
              DBHTitleScreenMenuItem(title: titles[index], isSelected: index == selectedIndex)
                .frame(width: dim * 0.75, height: 48)
                .onTapGesture {
                  selectedIndex = index
                }
            }

          }
          .frame(width: proxy.size.width, height: proxy.size.height)
        }
        .onAppear {
          isAnimating = true
        }
      
      }
    }
}

struct DBHTitleScreenMenu_Previews: PreviewProvider {
    static var previews: some View {
        DBHTitleScreenMenu()
    }
}
