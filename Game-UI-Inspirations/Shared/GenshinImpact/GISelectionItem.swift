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
          
          Image(systemName: item.image)
          .resizable()
          .scaledToFit()
          .foregroundColor(Color.brown)
          .shadow(color: .black, radius: 5, x: 1, y: 1)
        }
        .frame(height: proxy.size.height * 0.85)
        .clipShape(
          RoundedCornerRectangle(cornerRadius: dim * 0.2, corners: [.bottomRight])
        )
        
        HStack(spacing: 0) {
          ForEach(0..<item.rarity.rawValue) { _ in
            StarPolygon(points: 5, density: 2).fill(item.showStars ? Color.yellow : Color.clear)
              .frame(width: dim * 0.15)
          }
        }
        .frame(height: dim * 0.2)
        .offset(x: 0, y: dim * 0.85)
        
        VStack {
          Spacer()
          Text(item.label)
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
    .background(Color.black)
    .previewLayout(.sizeThatFits)
  }
}
