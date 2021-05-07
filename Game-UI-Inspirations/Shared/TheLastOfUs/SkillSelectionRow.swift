//
//  SkillSelectionRow.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/6/21.
//

import SwiftUI

struct SkillIcon: View {
  var icon: String = "ear"
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        Circle()
          .stroke(Color.white, lineWidth: 3)
          .background(Circle().foregroundColor(.black))
        
        Image(systemName: icon)
          .resizable()
          .scaledToFit()
          .foregroundColor(.white)
          .frame(width: dim * 0.7, height: dim * 0.7)
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct SkillSelectionRow: View {
    var selected: Bool = false
    var points: Int = 0
    var title: String = "Skill Name"
    var icon: String = "1.circle.fill"
  var skillLevelsAvailable: Int = 2
  var currentSkillLevel: Int = 0
  var enoughPoints: Bool = false
  
    var body: some View {
      HStack(spacing: 10) {
        SkillIcon(icon: icon)
          .frame(width: selected ? 60 : 50, height: selected ? 60 : 50)
        
        VStack(alignment:.leading) {
          Text(title.uppercased())
            .font(.body)
            .foregroundColor(enoughPoints ? .white : .red)
          HStack {
            ForEach(0..<skillLevelsAvailable) { index in
              if index < currentSkillLevel {
                Rectangle()
                  .stroke(Color.white, lineWidth: 3)
                  .frame(width: 20, height: 10)
                  .overlay(Color.white)
                
              } else {
                Rectangle()
                  .stroke(Color.white, lineWidth: 3)
                  .frame(width: 20, height: 10)
              }
            }
            Spacer()
          }
          .offset(x: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/, y: 0)
          
        }
        
        Spacer()
        
        HStack(spacing: 0) {
        SkillVitamin(color: enoughPoints ? .white : .red)
          .frame(width: selected ? 50 : 30, height: selected ? 50 : 30)
        Text("\(points)")
          .font(.system(size: selected ? 28 : 16))
          .foregroundColor(enoughPoints ? .white : .red)
        }
      }
      .padding()
      .border(selected ? Color.white : Color.clear, width: 2)
    }
}

struct SkillSelectionRow_Previews: PreviewProvider {
    static var previews: some View {
      Group {
        SkillSelectionRow(selected: false, points: 100, title: "Maximum Health", icon: "bolt.heart", skillLevelsAvailable: 2, currentSkillLevel: 1, enoughPoints: false)
        
        SkillSelectionRow(selected: true, points: 25, title: "Crafting Speed", icon: "wrench.fill", skillLevelsAvailable: 3, currentSkillLevel: 0, enoughPoints: true)
        
        SkillSelectionRow(selected: false, points: 50, title: "Listen Mode Distance", icon: "ear", skillLevelsAvailable: 3, currentSkillLevel: 2, enoughPoints: true)
      }
      .frame(width: 500)
      .previewLayout(.sizeThatFits)
      .background(Color.black.opacity(0.7))
    }
}
