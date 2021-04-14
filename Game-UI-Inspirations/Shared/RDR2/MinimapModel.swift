//
//  MinimapModel.swift
//  rdr2-map-overlay
//
//  Created by nutterfi on 4/2/21.
//

import UIKit

enum Allegiance {
  case posse
  case enemy
  case neutral
}

protocol Entity {
  var position: CGPoint { get set }
  var imageName: String { get }
//  func move(to: CGPoint)
}

struct Horse: Entity {
  var imageName: String = "horse"
  
  var position: CGPoint
}

enum LivingState {
  case alive
  case dead
  case skinned // looted for NPCs/Players
}

struct Animal: Entity {
  
  var imageName: String {
    switch livingState {
    case .alive:
      switch type {
      case .enemy:
        return "circle.fill"
      default:
        return ""
      }
    case .dead:
      return "hare.fill"
    case .skinned:
      return "hare"
    }
  }
  
  var position: CGPoint
  var type: Allegiance
  var livingState: LivingState
}

struct NPC: Entity {
  var imageName: String = "circle.fill"
  
  mutating func move(to: CGPoint) {
    self.position = to
  }
  
  var position: CGPoint
  var type: Allegiance
}

struct Player: Entity {
  var imageName: String = "circle.fill"
  
  mutating func move(to: CGPoint) {
    self.position = to
  }
  
  var position: CGPoint
  var type: Allegiance
}

struct POI: Entity {
  var imageName: String {
    switch category {
    case Category.quest:
      return "magnifyingglass.circle.fill"
    default:
      return ""
    }
  }
  
  var position: CGPoint
  
  struct Category {
    static let quest = "quest"
    static let postOffice = "postOffice"
    static let stable = "stable"
    static let generalStore = "generalStore"
    static let gunShop = "gunShop"
    static let butcher = "butcher"
  }
  
  var category: String = Category.quest
}
