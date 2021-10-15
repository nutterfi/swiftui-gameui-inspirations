//
//  GIRewardItem.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 10/14/21.
//

import SwiftUI

struct GIRewardItem: View {
  var item: GIItem
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack(alignment: .bottom) {
        GIItemRarityBackground(rarity: item.rarity)
        
        Image(systemName: item.image)
          .resizable()
          .scaledToFit()
          .foregroundColor(Color.brown)
          .shadow(color: .black, radius: 5, x: 1, y: 1)
          .padding()
        
        Color.black.opacity(0.5)
          .frame(height: dim * 0.25)
        Text(item.label)
          .font(.system(size: dim * 0.2))
          .foregroundColor(.white)
      }
      .clipShape(RoundedRectangle(cornerRadius: 5))
    }
  }
}

struct GIRewardItem_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      GIRewardItem(item: GIItem(image: "heart", rarity: .four, label: "50"))
        .background(Color.gray)
        .frame(width: 256, height: 256)
      
      GIRewardItem(item: GIItem(image: "house", rarity: .two, label: "1"))
        .background(Color.gray)
        .frame(width: 128, height: 256)
    }
    .previewLayout(.sizeThatFits)
    
  }
}
