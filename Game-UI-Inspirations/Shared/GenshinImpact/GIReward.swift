//
//  GIRewardItem.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 10/14/21.
//

import SwiftUI
import Shapes

struct GIReward: View {
  var item: GIItem
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack(alignment: .bottom) {
        GIItemRarityBackground(rarity: item.rarity)
        
        GIItemView(item: item)
          .frame(width: dim * 0.8)
        
        Color.black.opacity(0.5)
          .frame(height: dim * 0.25)
        Text(item.name)
          .font(.custom("GillSans", size: dim * 0.2))
          .foregroundColor(.white)
      }
      .clipShape(RoundedRectangle(cornerRadius: 5))
    }
  }
}

struct GIRewardItem_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      GIReward(item: GIItem(itemType: .starglitter, rarity: .five, name: "50"))
        .background(Color.gray)
        .frame(width: 256, height: 256)
      
      GIReward(item: GIItem(itemType: .stardust, rarity: .two, name: "1"))
        .background(Color.gray)
        .frame(width: 256, height: 256)
    }
    .previewLayout(.sizeThatFits)
    
  }
}
