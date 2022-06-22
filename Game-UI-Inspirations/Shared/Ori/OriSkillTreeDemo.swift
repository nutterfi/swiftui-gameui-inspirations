//
//  OriSkillTreeDemo.swift
//  Game-UI-Inspirations (iOS)
//
//  Created by nutterfi on 6/16/22.
//

import SwiftUI

struct OriSkillTreeDemo: View {
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          Color.black.ignoresSafeArea()
          LinearGradient(colors: [.black, .green, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
            .opacity(0.35)
          
          OriSkillWheel()
            .frame(width: dim * 0.95, height: dim * 0.95)
          
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct OriSkillTreeDemo_Previews: PreviewProvider {
    static var previews: some View {
        OriSkillTreeDemo()
        .previewInterfaceOrientation(.landscapeLeft)
    }
}
