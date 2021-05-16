//
//  TLOUSkillSelectMenuViewModel.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/15/21.
//

import Foundation

class TLOUSkillSelectMenuViewModel: ObservableObject {
  @Published private(set) var skills: [TLOUSkillModel] = []
  @Published private(set) var points: Int = 285
  
  init() {
    skills.append(TLOUSkillModel(id: SkillIconType.maximumHealth, currentLevel: 1, pointCost: [50, 100]))
      
    skills.append(TLOUSkillModel(id: SkillIconType.healingSpeed, currentLevel: 0, pointCost: [30, 60, 90]))
    
    skills.append(TLOUSkillModel(id: SkillIconType.weaponSway, currentLevel: 1, pointCost: [50, 100]))
  }
  
  func title(for id: String) -> String {
    switch id {
    case SkillIconType.maximumHealth:
      return "Maximum Health"
    case SkillIconType.healingSpeed:
      return "Healing Speed"
    case SkillIconType.weaponSway:
      return "Weapon Sway"
    default:
      return ""
    }
  }
  
  func purchase(skillID: String) {
    guard let index = skills.firstIndex(where: {$0.id == skillID})
    else { return }
    guard skills[index].nextLevelCost <= points else { return }
    points -= skills[index].nextLevelCost
    
    if skills[index].currentLevel < skills[index].levelsAvailable {
      skills[index].currentLevel += 1
    }
  }
  
}
