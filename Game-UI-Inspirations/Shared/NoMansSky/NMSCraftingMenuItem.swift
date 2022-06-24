//
//  NMSCraftingMenuItem.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 6/23/22.
//

import SwiftUI

struct NMSCraftingMenuItem: View {
  var title: String = "Breakfast foods are best foods"
  var image: String
  var color: Color
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          VStack(spacing: 0) {
            MarqueeText(text: title)
              .background(Color.white)
              .frame(width: dim, height: 50)
            color
              .overlay(
                Image(systemName: image)
                  .resizable()
                  .scaledToFit()
                  .padding()
              )
          }
        }
        .border(Color.white, width: 10)
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct NMSCraftingMenuItem_Previews: PreviewProvider {
  static var previews: some View {
    HStack(spacing: 20) {
      NMSCraftingMenuItem(title: "Four score and seven years ago", image: "pencil", color: .red)
        .frame(width: 200, height: 300)
      
      NMSCraftingMenuItem(title: "I want to ride my bicycle", image: "speedometer", color: .blue)
        .frame(width: 200, height: 300)
      
      
      NMSCraftingMenuItem(image: "ladybug", color: .green)
        .frame(width: 200, height: 300)
    }
    .padding()
    .background(LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
    .previewLayout(.sizeThatFits)
    
  }
}
