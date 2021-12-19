//
//  SpiderManSkill.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 12/10/21.
//

import Foundation

enum SpiderManSkillType {
  case venom
  case combat
  case camoflauge
}

/// The basic skill building block.
struct SpiderManSkill: Identifiable {
  var id: String
  var type: SpiderManSkillType
  var name: String
  var description: String
  var behavior: Any? // upgrades to player state
}

extension SpiderManSkill {
  static var sample: SpiderManSkill {
    SpiderManSkill(
      id: "venom1",
      type: .venom,
      name: "Venom Jump",
      description: "Pressing L1 + X launches nearby enemies into the air, disarming and Venom Stunning them.",
      behavior: nil
    )
  }
}
