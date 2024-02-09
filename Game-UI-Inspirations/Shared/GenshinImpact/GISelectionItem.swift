//
//  GISelectionItem.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 10/12/21.
//

import SwiftUI
import Shapes

struct GISelectionItem: View {
  var item: GIItem
  
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack(alignment: .top) {
        ZStack {
          GIItemRarityBackground(rarity: item.rarity)
          
          GIItemView(item: item)
          .foregroundColor(Color.brown)
        }
        .frame(height: proxy.size.height * 0.85)
        .clipShape(
          UnevenRoundedRectangle(bottomTrailingRadius: dim * 0.2)
        )
        
        HStack(spacing: 0) {
          ForEach(0..<item.rarity.rawValue, id:\.self) { _ in
            IsotoxalPolygon(sidePairs: 5, innerRadius: 0.6 ).fill(item.showStars ? Color.yellow : Color.clear)
              .frame(width: dim * 0.15)
          }
        }
        .frame(height: dim * 0.2)
        .offset(x: 0, y: dim * 0.85)
        
        VStack {
          Spacer()
          Text(item.name)
            .font(.custom("GillSans", size: dim * 0.15))
        }
      }
      .background(Color("giWhite"))
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
    .clipShape(RoundedRectangle(cornerRadius: 5))
  }
}

struct GISelectionItem_Previews: PreviewProvider {
  static var previews: some View {
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
    .background(Color.black)
    .previewLayout(.sizeThatFits)
  }
}
