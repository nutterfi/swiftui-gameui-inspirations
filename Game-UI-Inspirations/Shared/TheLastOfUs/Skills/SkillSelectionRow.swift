//
//  SkillSelectionRow.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/6/21.
//

import SwiftUI

struct SkillSelectionRow: View {
  var selected: Bool = false
  var points: Int = 0
  var title: String = "Skill Name"
  var icon: String = "1.circle.fill"
  var skillLevelsAvailable: Int = 2
  var currentSkillLevel: Int = 0
  var enoughPoints: Bool = false
  // hide the skill points if max level
  var showSkillPoints : Bool {
    currentSkillLevel < skillLevelsAvailable
  }
  
  var body: some View {
    ZStack(alignment: .leading) {
      let offsetSize: CGSize = selected ? CGSize(width: -10, height: 0) : .zero
      HStack() {
        Spacer(minLength: 50)
        VStack(alignment:.leading) {
          Text(title.uppercased())
            .font(.body)
            .foregroundColor(showSkillPoints && enoughPoints ? .white : .red)
          HStack {
            ForEach(0..<skillLevelsAvailable, id:\.self) { index in
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
          .offset(x: 10.0, y: 0)
          
        }
        .padding(5)
        
        Spacer()
        
        // hide this if we are already max level
        Group {
          if showSkillPoints {
            HStack(spacing: 0) {
              SkillVitamin(color: enoughPoints ? .white : .red)
                .frame(width: selected ? 50 : 30, height: selected ? 50 : 30)
              Text("\(points)")
                .font(.system(size: selected ? 28 : 16))
                .foregroundColor(enoughPoints ? .white : .red)
            }
          } else {
            EmptyView()
          }
        }
        .padding(.trailing)
      }
      .border(selected ? Color.white : Color.clear, width: 2)
      
      SkillIcon(icon: icon)
        .frame(width: selected ? 60 : 50, height: selected ? 60 : 50)
        .offset(offsetSize)
    }
  }
}

struct SkillSelectionRow_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      SkillSelectionRow(selected: false, points: 100, title: "Maximum Health", icon: SkillIconType.maximumHealth, skillLevelsAvailable: 2, currentSkillLevel: 1, enoughPoints: false)
      
      SkillSelectionRow(selected: true, points: 100, title: "Weapon Sway", icon: SkillIconType.weaponSway, skillLevelsAvailable: 2, currentSkillLevel: 1, enoughPoints: true)
      
      SkillSelectionRow(selected: false, points: 30, title: "Healing Speed", icon: SkillIconType.healingSpeed, skillLevelsAvailable: 3, currentSkillLevel: 0, enoughPoints: true)
    }
    .frame(width: 500)
    .previewLayout(.sizeThatFits)
    .background(Color.black.opacity(0.7))
  }
}
