//
//  SkillMaxHealth.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/8/21.
//

import SwiftUI
import Shapes

struct SkillMaxHealth: View {
  var primary: Color = .white
  var secondary: Color = .black
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        Heart()
          .fill(primary)
          .frame(width: dim, height: dim)
        
        secondary
          .frame(width: dim / 3, height: dim / 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        
        secondary
          .frame(width: dim / 10, height: dim / 3, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct SkillMaxHealth_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      SkillMaxHealth(primary: .purple, secondary: .yellow)
        .frame(width: 200, height: 200)
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
      
      SkillMaxHealth()
        .frame(width: 200, height: 200)
    }
    .background(Color.gray)
  }
}
