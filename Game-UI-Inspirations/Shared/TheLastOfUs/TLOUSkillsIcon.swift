//
//  TLOUSkillsIcon.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/4/21.
//

import SwiftUI

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
        
        SkillVitamin(color: pointsAvailable ? .tlouYellow : .white)
          .frame(width: scaleFactor * dim, height: scaleFactor * dim)
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
    VStack {
    TLOUSkillsIcon(pointsAvailable: true)
      .padding()
    
    TLOUSkillsIcon(pointsAvailable: false)
      .padding()
    }
  }
}
