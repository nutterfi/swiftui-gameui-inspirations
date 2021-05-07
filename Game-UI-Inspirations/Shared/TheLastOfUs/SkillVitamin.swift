//
//  SkillVitamin.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/6/21.
//

import SwiftUI

struct SkillVitamin: View {
  var color: Color
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          MaskedProgressBar(progress: 0.5, backView: Color.clear, frontView: color, mask: Capsule())
            .frame(width: dim * 0.7, height: dim * 0.3)
            .overlay(
              Capsule()
                .stroke(color, lineWidth: dim / 30)
            )
            .rotationEffect(Angle(degrees: -25))
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct SkillVitamin_Previews: PreviewProvider {
    static var previews: some View {
      SkillVitamin(color: .red)
    }
}
