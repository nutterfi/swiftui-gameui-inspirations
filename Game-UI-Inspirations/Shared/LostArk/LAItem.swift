//
//  GIItem.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/26/22.
//

import Foundation
import SwiftUI

// Sample types of items obtainable in the game
enum LAItemType {

}

struct LAItem: Identifiable {
  var id = UUID().uuidString
  var itemType: LAItemType
  var rarity: LAItemRarity
  var name: String
  
  var locked: Bool = false
  var new: Bool = false
}

enum LAItemRarity: String {
  case common, uncommon, rare, epic, legendary
  
  var color: (String, String) {
    switch self {
    case .common: return ("giGray", "giGray-1")
    case .uncommon: return ("giGreen", "giGreen-1")
    case .rare: return ("giBlue", "giBlue-1")
    case .epic: return ("giPurple", "giPurple-1")
    case .legendary: return ("giOrange", "giOrange-1")
    }
  }
}

