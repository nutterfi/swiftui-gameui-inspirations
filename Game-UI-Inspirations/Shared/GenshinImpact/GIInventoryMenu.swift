//
//  GIInventoryMenu.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 10/14/21.
//

import SwiftUI

struct GIInventoryMenu: View {
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        VStack {
          ScrollView(.horizontal) {
            HStack {
              let items: [GIItem] = [
                GIItem(image: "person.fill", rarity: .five, label: "Nutterfi", showStars: false),
                GIItem(image: "pencil.tip", rarity: .two, label: "Lv. 80"),
                GIItem(image: "ladybug", rarity: .three, label: "23"),
                GIItem(image: "", rarity: .one, label: "1"),
                GIItem(image: "bicycle", rarity: .four, label: "1")
              ]
              
              ForEach(items) { item in
                GISelectionItem(item: item)
                  .frame(width: 100, height: 120)
              }
            }
          }
          Spacer()
          GenshinImpactLoadingProgressBar()
        }
        
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct GIInventoryMenu_Previews: PreviewProvider {
  static var previews: some View {
    GIInventoryMenu()
      .previewInterfaceOrientation(.portraitUpsideDown)
  }
}
