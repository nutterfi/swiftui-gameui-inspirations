//
//  GIAchievementMenu.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 12/20/21.
//

import SwiftUI

struct GIMenuIdentifier {
  static let clock = "clock"
  static let loadingProgressBar = "loadingProgressBar"
  static let rewardItem = "rewardItem"
  static let inventoryMenu = "inventoryMenu"
}

struct GIMenuItem: Identifiable {
  let id = UUID()
  let menuIdentifier: String
  var title: String
}

struct GIAchievementMenu: View {
  let layout = Array(repeating: GridItem(), count: 3)
  var items: [GIMenuItem] {
    [
      GIMenuItem(menuIdentifier: GIMenuIdentifier.clock, title: "Clock"),
      GIMenuItem(menuIdentifier: GIMenuIdentifier.loadingProgressBar, title: "Loading Progress Bar"),
      GIMenuItem(menuIdentifier: GIMenuIdentifier.rewardItem, title: "Reward Item"),
      GIMenuItem(menuIdentifier: GIMenuIdentifier.inventoryMenu, title: "Inventory Menu")
    ]
  }
  
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        LinearGradient(colors: [.blue, .green], startPoint: .topLeading, endPoint: .bottomTrailing)
          .ignoresSafeArea()
        LazyVGrid(columns: layout) {
          ForEach(items) { item in
            NavigationLink(destination: destination(for: item.menuIdentifier)) {
              GIAchievementView(text: item.title)
                .frame(width: 100, height: 150)
            }
          }
        }
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
  
  func destination(for title: String) -> some View {
    Group {
      switch title {
      case GIMenuIdentifier.inventoryMenu:
        GIInventoryMenu()
      case GIMenuIdentifier.clock:
        GIClockView()
      case GIMenuIdentifier.loadingProgressBar:
        GILoadingProgressBar()
      case GIMenuIdentifier.rewardItem:
        GIRewardItem(item: GIItem(image: "does not matter", rarity: .five, label: "100"))
          .frame(width: 100, height: 100)
      default:
        Circle().frame(width: .infinity, height: .infinity)
          .overlay(
            Text("ERROR\r\n Unknown Menu Identifier")
              .foregroundColor(.white)
              .italic()
          )
          .padding()
      }
    }
  }
}

struct GIAchievementMenu_Previews: PreviewProvider {
  static var previews: some View {
    GIAchievementMenu()
  }
}
