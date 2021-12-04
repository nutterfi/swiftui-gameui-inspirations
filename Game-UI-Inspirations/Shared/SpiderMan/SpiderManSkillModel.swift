//
//  SpiderManSkillModel.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 12/2/21.
//

import Foundation

enum SpiderManSkillType {
  case venom
  case combat
  case unknown
}

enum SpiderManSkillState {
  // not purchased
  // owned
  // locked, locked-unknown
  case hidden
  case unlocked
  case locked
}

/**
  each skill is one of three types (four?), venom, combat, unknown...
  skill state is either locked, unlocked, hidden
 */
struct SpiderManSkill: Identifiable {
  var id = UUID()
  var type: SpiderManSkillType
  var state: SpiderManSkillState
  var name: String
  var description: String
}
