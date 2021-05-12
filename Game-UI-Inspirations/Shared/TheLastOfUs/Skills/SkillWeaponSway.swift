//
//  SkillWeaponSway.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/11/21.
//

import SwiftUI
import Shapes

struct SkillWeaponSway: View {
  var color: Color = .white
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        Circle()
          .inset(by: dim / 10)
          .trim(from: 0.48, to: 0.78)
          .stroke(lineWidth: dim / 20)
        
        Circle()
          .inset(by: 2 * dim / 10)
          .trim(from: 0.5, to: 0.75)
          .stroke(lineWidth: dim / 20)
        
        Circle()
          .inset(by: dim / 10)
          .trim(from: 0.48, to: 0.78)
          .stroke(lineWidth: dim / 20)
          .rotation(Angle(radians: .pi))
        
        Circle()
          .inset(by: 2 * dim / 10)
          .trim(from: 0.5, to: 0.75)
          .stroke(lineWidth: dim / 20)
          .rotation(Angle(radians: .pi))
      }
      .foregroundColor(color)
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct SkillWeaponSway_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      SkillWeaponSway(color: .purple)
        .frame(width: 200, height: 200)
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
      
      SkillWeaponSway()
        .frame(width: 200, height: 200)
    }
    .background(Color.gray)
  }
}
