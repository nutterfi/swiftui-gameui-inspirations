//
//  SkillIcon.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/15/21.
//

import SwiftUI

struct SkillIconType {
  static let maximumHealth = "maximumHealth"
  static let healingSpeed = "healingSpeed"
  static let weaponSway = "weaponSway"
}

struct SkillIcon: View {
  var icon: String = SkillIconType.maximumHealth
  var body: some View {
    GeometryReader { proxy in
      ZStack {
        Circle()
          .stroke(Color.white, lineWidth: 3)
          .background(Circle().foregroundColor(.black))
        
        Group {
          switch icon {
          case SkillIconType.maximumHealth:
            SkillMaxHealth()
          case SkillIconType.healingSpeed:
            SkillHealingSpeed()
          case SkillIconType.weaponSway:
            SkillWeaponSway()
          default:
            Circle()
          }
        }
        
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct SkillIcon_Previews: PreviewProvider {
    static var previews: some View {
        SkillIcon()
    }
}
