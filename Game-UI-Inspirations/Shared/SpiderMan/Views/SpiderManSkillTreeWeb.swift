//
//  SpiderManSkillTreeWeb.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 12/9/21.
//

import SwiftUI
import Shapes

/// the backdrop to the skill tree
struct SpiderManSkillTreeWeb: View {
  var sides: Int
  let controlPointRatio = 0.03
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      let gradient = RadialGradient(colors: [.clear, .spiderManTeal], center: .center, startRadius: 0, endRadius: dim * 0.5)
      
      ZStack {
        Torx(sides: sides, controlPointRatio: controlPointRatio)
          .trim(from: 0, to: 0.5)
          .fill(gradient)
          
        ForEach(0..<5) { index in
          Torx(sides: sides, controlPointRatio: controlPointRatio)
            .inset(by: CGFloat(index) * dim * 0.08)
            .trim(from: 0, to: 0.5)
            .stroke(Color.spiderManSkillBorder)
        }
        
        IsotoxalPolygon(sides: sides * 2, innerRadius: 0)
          .trim(from: 0, to: 0.5)
          .stroke(Color.spiderManSkillBorder, lineWidth: 1)
        
        Torx(sides: sides, controlPointRatio: controlPointRatio)
          .inset(by: dim * 0.32)
          .trim(from: 0, to: 0.5)
          .fill(.white)
        Torx(sides: sides, controlPointRatio: controlPointRatio)
          .inset(by: dim * 0.32)
          .trim(from: 0, to: 0.5)
          .fill(Color.spiderManSkillBorder)
      }
      .rotationEffect(.degrees(-90))
      .scaleEffect(2)
      .frame(width: proxy.size.width, height: proxy.size.height)
      .offset(x:0, y: proxy.size.height * 0.5)
    }
    
  }
}

struct SpiderManSkillsMapWeb_Previews: PreviewProvider {
  static var previews: some View {
    SpiderManSkillTreeWeb(sides: 12)
    .frame(width: 256, height: 256)
    .background(Color.black)
    .previewLayout(.sizeThatFits)
  }
}
