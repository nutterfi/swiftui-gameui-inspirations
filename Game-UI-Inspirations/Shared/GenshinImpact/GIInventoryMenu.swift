//
//  GIInventoryMenu.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 10/14/21.
//

import SwiftUI

struct GIInventoryMenu: View {
  var body: some View {
    ScrollView(.horizontal) {
      HStack {
        let items: [GIItem] = [
          GIItem(itemType: .character, rarity: .five, name: "Nutterfi", showStars: false),
          GIItem(itemType: .mora, rarity: .two, name: "10000"),
          GIItem(itemType: .stardust, rarity: .three, name: "23"),
          GIItem(itemType: .starglitter, rarity: .one, name: "1"),
          GIItem(itemType: .primogem, rarity: .four, name: "1")
        ]
        
        ForEach(items) { item in
          GISelectionItem(item: item)
            .frame(width: 100, height: 120)
        }
      }
    }
  }
}

struct GIInventoryMenu_Previews: PreviewProvider {
  static var previews: some View {
    GIInventoryMenu()
      .previewLayout(.sizeThatFits)
  }
}
