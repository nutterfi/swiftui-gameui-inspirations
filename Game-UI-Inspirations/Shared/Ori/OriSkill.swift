//
//  OriSkill.swift
//  Game-UI-Inspirations (iOS)
//
//  Created by nutterfi on 6/16/22.
//

import Foundation

enum OriSkill: Int, Identifiable, CaseIterable, CustomStringConvertible {
  case spiritFlame
  case wallJump
  case chargeFlame
  case doubleJump
  case bash
  case stomp
  case locked7
  case locked8
  case locked9
  case locked10
  case locked11
  
  var id: Int { self.rawValue }
  
  var description: String {
    switch self {
    case .spiritFlame:
      return "Sprit Flame"
    case .wallJump:
      return "Wall Jump"
    case .chargeFlame:
      return "Charge Flame"
    case .doubleJump:
      return "Double Jump"
    case .bash:
      return "Bash"
    case .stomp:
      return "Stomp"
    case .locked7, .locked8, .locked9, .locked10, .locked11:
      return "Locked"
    }
  }
}
