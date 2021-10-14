//
//  GISelectionItem.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 10/12/21.
//

import SwiftUI
import Shapes

struct GIItem: Identifiable {
  var id = UUID().uuidString
  
  var image: String
  var rarity: GIItemRarity
  var label: String
  
  var showStars: Bool = true
  var locked: Bool = false
  var new: Bool = false
}

enum GIItemRarity: Int {
  case one = 1, two, three, four, five
  
  var color: (Color, Color) {
    switch self {
    case .one: return (Color("giGray"), Color("giGray-1"))
    case .two: return (Color("giGreen"), Color("giGreen-1"))
    case .three: return (Color("giBlue"), Color("giBlue-1"))
    case .four: return (Color("giPurple"), Color("giPurple-1"))
    case .five: return (Color("giOrange"), Color("giOrange-1"))
    }
  }
}

struct GISelectionItem: View {
  var item: GIItem
  
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack(alignment: .top) {
        ZStack {
          TriquetraView(lineWidth: dim * 0.12)
            .foregroundColor(Color.white.opacity(0.08))
            .rotationEffect(.degrees(180))
            .offset(x: 0, y: dim * 0.05)
          Circle()
            .foregroundColor(.white.opacity(0.08))
            .frame(width: dim * 0.15)
            .offset(x: 0, y: -dim * 0.05)
          Image(systemName: item.image)
          .resizable()
          .scaledToFit()
          .foregroundColor(Color.brown)
          .shadow(color: .black, radius: 5, x: 1, y: 1)
        }
        .background(
          LinearGradient(colors: [item.rarity.color.0, item.rarity.color.1], startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .frame(height: proxy.size.height * 0.85)
        .clipShape(
          RoundedCornerRectangle(cornerRadius: dim * 0.2, corners: [.bottomRight])
        )
        
        HStack(spacing: 0) {
          ForEach(0..<item.rarity.rawValue) { _ in
            StarPolygon(points: 5, density: 2).fill(Color.yellow)
              .frame(width: dim * 0.15)
          }
        }
        .frame(height: dim * 0.2)
        .offset(x: 0, y: dim * 0.85)
        
        VStack {
          Spacer()
          Text(item.label)
            .font(.system(size: dim * 0.15))
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
