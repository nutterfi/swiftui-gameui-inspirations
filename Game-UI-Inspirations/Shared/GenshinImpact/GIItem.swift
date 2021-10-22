//
//  GIItem.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 10/14/21.
//

import Foundation

struct GIItem: Identifiable {
  var id = UUID().uuidString
  // TODO: Replace with "GIItemType"
  var image: String
  var rarity: GIItemRarity
  var label: String
  
  var showStars: Bool = true
  var locked: Bool = false
  var new: Bool = false
}

enum GIItemRarity: Int {
  case one = 1, two, three, four, five
  
  var color: (String, String) {
    switch self {
    case .one: return ("giGray", "giGray-1")
    case .two: return ("giGreen", "giGreen-1")
    case .three: return ("giBlue", "giBlue-1")
    case .four: return ("giPurple", "giPurple-1")
    case .five: return ("giOrange", "giOrange-1")
    }
  }
}
