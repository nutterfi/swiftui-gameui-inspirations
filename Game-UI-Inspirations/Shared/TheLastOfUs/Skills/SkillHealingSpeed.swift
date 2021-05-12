//
//  SkillHealingSpeed.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/11/21.
//

import SwiftUI
import Shapes

struct SkillHealingSpeed: View {
  var color: Color = .white
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        color
          .frame(width: dim / 2, height: dim / 10)
        
        color
          .frame(width: dim / 10, height: dim / 2)
        
        HStack(spacing: dim / 60) {
          Group {
            Polygon(sides: 3)
            Polygon(sides: 3)
          }
          .foregroundColor(color)
          .frame(width: dim / 10)
        }
        .offset(x: dim / 5, y: dim / 5)
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
      .offset(x: -dim / 20, y: 0)
    }
  }
}

struct SkillHealingSpeed_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      SkillHealingSpeed(color: .purple)
        .frame(width: 200, height: 200)
        .border(Color.black)
      
      SkillHealingSpeed()
        .frame(width: 200, height: 200)
    }
    .background(Color.gray)
  }
}
