//
//  GIItem.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 10/14/21.
//

import Foundation
import SwiftUI

// Sample types of items obtainable in the game
enum GIItemType {
  case character
  case mora
  case starglitter
  case stardust
  case primogem // haven't yet defined
}

struct GIItem: Identifiable {
  var id = UUID().uuidString
  var itemType: GIItemType
  var rarity: GIItemRarity
  var name: String
  
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

struct GIItemView: View {
  var item: GIItem
  var body: some View {
    Group {
      switch item.itemType {
      case .mora:
        Mora()
      case .primogem:
        TwoTonedIsotoxalPolygon(sides: 2, color1: .white, color2: Color("giBlue"))
      case .starglitter:
        MasterlessStarglitter()
      case .character:
        PersonProfile()
          .shadow(color: .black, radius: 5, x: 1, y: 1)

      case .stardust:
        MasterlessStardust()
      }
    }
  }
}
