//
//  SpiderManSkillViewModel.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 12/7/21.
//

import Foundation
import Combine

class SpiderManSkillViewModel: ObservableObject {
  @Published private(set) var model: SpiderManSkillModel
  @Published private(set) var selectedSkillId: String = SpiderManSkill.sample.id
  
  var selectedSkillState: SpiderManSkillState {
    skillState(with: selectedSkillId) ?? SpiderManSkillState.sample
  }
  
  init() {
    model = SpiderManSkillModel()
    model.buildTrees()
  }
  
  func skillState(with id: String) -> SpiderManSkillState? {
    model.skills[id]
  }
  
  func selectSkill(id: String) {
    selectedSkillId = id
  }
  
  func skillStates(skillType: SpiderManSkillType) -> [SpiderManSkillState] {
    model.skillStates(skillType: skillType)
  }
  
  func unlockSkill(id: String) {
    model.unlockSkill(id: id)
  }
  
  func isSkillUnlockable(id: String) -> Bool {
    model.isSkillUnlockable(id: id)
  }
  
}

