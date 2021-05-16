//
//  TLOUSkillModel.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/15/21.
//

import Foundation

struct TLOUSkillModel: Identifiable {
  var id: String
  var currentLevel: Int // starts at 0
  var pointCost: [Int]
  
  var nextLevelCost: Int {
    guard currentLevel < pointCost.count else { return 0 }
    return pointCost[currentLevel]
  }
  
  var levelsAvailable: Int {
    pointCost.count
  }
  
}
