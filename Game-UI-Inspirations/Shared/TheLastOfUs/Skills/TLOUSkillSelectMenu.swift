//
//  TLOUSkillSelectMenu.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/11/21.
//

import SwiftUI

struct TLOUSkillModel: Identifiable {
  var id: String
  var currentLevel: Int // starts at 0
  var pointCost: [Int]
  
  var nextLevelCost: Int {
    pointCost[currentLevel]
  }
  
  var levelsAvailable: Int {
    pointCost.count
  }
  
}

class TLOUSkillSelectMenuViewModel: ObservableObject {
  @Published private(set) var skills: [TLOUSkillModel] = []
  @Published var selected$Index: Int = 0
  
  init() {
    skills.append(TLOUSkillModel(id: SkillIconType.maximumHealth, currentLevel: 1, pointCost: [50, 100]))
      
    skills.append(TLOUSkillModel(id: SkillIconType.healingSpeed, currentLevel: 0, pointCost: [30, 60, 90]))
    
    skills.append(TLOUSkillModel(id: SkillIconType.weaponSway, currentLevel: 1, pointCost: [50, 100]))
  }
}

struct TLOUSkillSelectMenu: View {
  @StateObject var viewModel = TLOUSkillSelectMenuViewModel()
    var body: some View {
      List(viewModel.skills) { skill in
        
        SkillSelectionRow(selected: false, points: skill.nextLevelCost, title: skill.id, icon: skill.id, skillLevelsAvailable: skill.levelsAvailable, currentSkillLevel: skill.currentLevel, enoughPoints: false)
          .background(Color.black)

      }
    }
}

struct TLOUSkillSelectMenu_Previews: PreviewProvider {
    static var previews: some View {
      TLOUSkillSelectMenu()
        .previewDevice("iPhone 12 Pro Max")
          .background(Color.black)
    }
}
