//
//  TLOUSkillsIcon.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/4/21.
//

import SwiftUI

extension Color {
  static var tlouYellow: Color {
    Color(red: 173.0/255, green: 156.0/255, blue: 93.0/255)
  }
}

//FIXME: Fix animation color glitch
struct TLOUSkillsIcon: View {
  @State private var isAnimating: Bool = false
  var pointsAvailable: Bool
  
    var body: some View {
      GeometryReader { proxy in
        let scaleFactor: CGFloat = isAnimating ? 1.1 : 1
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          RadialGradient(gradient: Gradient(colors: [ Color.black.opacity(0.7), Color.gray.opacity(0.7)]), center: .center, startRadius: dim * 0.5 * 0.4, endRadius: dim)
            .frame(width: dim, height: dim)
          
          // Skill Pill
          MaskedProgressBar(progress: 0.5, backView: Color.clear, frontView: isAnimating ? Color.tlouYellow : Color.white, mask: Capsule())
            .frame(width: scaleFactor * dim * 0.7, height: scaleFactor * dim * 0.3)
            .overlay(
              Capsule()
                .stroke(isAnimating ? Color.tlouYellow : Color.white, lineWidth: dim / 30)
            )
            .rotationEffect(Angle(degrees: -25))
            .offset(x: 0, y: dim / 12)
            
          
          Rectangle()
            .stroke(Color.gray, lineWidth: dim / 30)
            .frame(width: dim, height: dim)
          
        }
        .animation(Animation.easeInOut(duration: 0.75).repeatForever(autoreverses: true))
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
      .onAppear {
        isAnimating = pointsAvailable
      }
    }
}

struct TLOUSkillsIcon_Previews: PreviewProvider {
    static var previews: some View {
      HStack {
        TLOUSkillsIcon(pointsAvailable: true)
        
//        TLOUSkillsIcon(pointsAvailable: false)
      }
      .background(Color.black)
      .padding()
    }
}
