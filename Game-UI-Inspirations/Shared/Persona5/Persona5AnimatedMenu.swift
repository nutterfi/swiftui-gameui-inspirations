//
//  Persona5AnimatedMenu.swift
//  Game-UI-Inspirations (iOS)
//
//  Created by nutterfi on 1/13/22.
//

import SwiftUI
import Shapes

// TODO: Animate!
struct Persona5AnimatedMenu: View {
  var title: String
  
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        Color.red.ignoresSafeArea()
        HStack(spacing: 0) {
          Group {
            TextShape(letter: "p")
              .outline()
            TextShape(letter: "e")
              .outline()
            TextShape(letter: "r")
              .outline()
            TextShape(letter: "s")
              .outline()
            TextShape(letter: "o")
              .outline()
            TextShape(letter: "n")
              .outline()
            TextShape(letter: "a")
              .outline()
            TextShape(letter: "5")
              .outline()
          }
          
        }
        .frame(height: dim * 0.25)
        .background(
        Parallelogram(pct: 0.3)
          .foregroundColor(.white)
          .frame(height: dim * 0.3)
        )
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct Persona5AnimatedMenu_Previews: PreviewProvider {
  static var previews: some View {
    Persona5AnimatedMenu(title: "Persona 5")
  }
}
