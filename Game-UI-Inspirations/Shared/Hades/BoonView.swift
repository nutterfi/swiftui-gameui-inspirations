//
//  BoonView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/1/21.
//

import SwiftUI
import Shapes

extension Color {
  static var hadesZeusYellow: Color {
    Color(red: 251/255, green: 246/255, blue: 92/255)
  }
  
  static var hadesZeusOrange: Color {
    Color(red: 252/255, green: 186/255, blue: 67/255)
  }
}

struct Boon {
  static let zeus = "zeus"
  static let ares = "ares"
  static let artemis = "artemis"
  static let hermes = "hermes"
  static let aphrodite = "aphrodite"
  static let poseidon = "poseidon"
  static let chaos = "chaos"
}

struct BoonView: View {
  var boon: String
  
    var body: some View {
      GeometryReader { proxy in
        ZStack {
          Circle()
            .foregroundColor(Color.black.opacity(0.3))
          view(for: boon)
            .frame(width: proxy.size.width * 0.5, height: proxy.size.height * 0.8)
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
  
  func view(for boon: String) -> some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        switch boon {
        case Boon.zeus:
          LinearGradient(gradient: Gradient(colors: [.white, .hadesZeusYellow, .hadesZeusOrange, .hadesZeusYellow]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .mask(
              ZeusBoon()
//                .frame(width: dim * 0.8, height: dim * 0.8)
            )
        case Boon.poseidon:
          LinearGradient(gradient: Gradient(colors: [.blue, .white, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .mask(
              PoseidonBoon()
//                .frame(width: dim * 0.8, height: dim * 0.8)
            )
          
        default:
          Image(systemName: "questionmark.circle")
            .resizable()
            .scaledToFit()
        }
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
    
  }

}

struct BoonView_Previews: PreviewProvider {
    static var previews: some View {
      VStack {
        BoonView(boon: Boon.zeus)
        BoonView(boon: Boon.poseidon)
      }
      .background(Color.blue)
        .padding()
    }
}
