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
  var rank: GIItemRank
  var label: String
  
  var showStars: Bool = true
  var locked: Bool = false
  var new: Bool = false
}

enum GIItemRank: Int {
  case one = 1, two, three, four, five
  
  var color: Color {
    switch self {
    case .one: return .gray
    case .two: return .green
    case .three: return .blue
    case .four: return .purple
    case .five: return .orange
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
          TriquetraView(lineWidth: 40)
            .foregroundColor(Color.white.opacity(0.08))
            .rotationEffect(.degrees(180))
            .scaleEffect(1.2)
            .offset(x: 0, y: dim * 0.2)
          
          Image(systemName: item.image)
          .resizable()
          .scaledToFit()
        }
        .background(item.rank.color)
        .frame(height: proxy.size.height * 0.85)
        .clipShape(
          RoundedCornerRectangle(cornerRadius: dim * 0.2, corners: [.bottomRight])
        )
        
        HStack(spacing: 0) {
          ForEach(0..<item.rank.rawValue) { _ in
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
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
    .clipShape(RoundedRectangle(cornerRadius: 12))
  }
}

struct GISelectionItem_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      let items: [GIItem] = [
        GIItem(image: "person.fill", rank: .five, label: "Lv.80", showStars: false),
        GIItem(image: "pencil.tip", rank: .two, label: "Lv.80"),
        GIItem(image: "ladybug", rank: .three, label: "23")
      ]
      
      ForEach(items) { item in
        GISelectionItem(item: item)
      }
    }
    .previewLayout(.sizeThatFits)
    .frame(width: 100, height: 120)
  }
}
