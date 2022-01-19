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
  
  init() {
    model = SpiderManSkillModel()
    model.buildTrees()
  }
  
  var sections: Int {
    return 4
  }
  
  func numberOfRows(in section: Int) -> Int {
    return 1
  }
  
  func blob(at index: IndexPath) -> SpiderManSkillState {
    guard let blob = model.skills["venom2"] else { fatalError() }
    return blob
  }
  
  func skillState(with id: String) -> SpiderManSkillState? {
    model.skills[id]
  }
  
  func selectSkill(id: String) {
    selectedSkillId = id
  }
  
  func skillStates(skillType: SpiderManSkillType) -> [SpiderManSkillState] {
    let skills: [SpiderManSkillState]
    switch skillType {
    case .venom:
      skills = model.venomTree.skills
    case .combat:
      skills = model.combatTree.skills
    case .camoflauge:
      skills = model.cloakTree.skills
    }
    return skills
  }
  
}

