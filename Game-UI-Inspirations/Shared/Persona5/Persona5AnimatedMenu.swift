//
//  Persona5AnimatedMenu.swift
//  Game-UI-Inspirations (iOS)
//
//  Created by nutterfi on 1/13/22.
//

import SwiftUI
import Shapes

struct Persona5MenuItem: View {
  var selected: Bool = false
  var text: String
  @State private var animating: Bool = false
  
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        HStack(spacing: 0) {
          ForEach(0..<text.count) { index in
            let letter = String(text.prefix(index+1).suffix(1))
            TextShape(letter: letter.lowercased())
              .outline()
          }
          
        }
        .frame(height: dim * 0.25)
        .colorInvertedOverlay(
          overlay: Parallelogram(pct: 0.35)
            .frame(width: proxy.size.width * 0.783, height: dim * 0.25)
            .opacity(selected ? 1.0 : 0.0)
            .foregroundColor(Color.yellow)
            .rotation3DEffect(!animating ? .zero : .degrees(20), axis: (x: 1.3, y: 0.8, z: 0))
            .animation(
              Animation
                .easeInOut(duration: 0.15)
                .repeatForever(),
              value: animating
            )
        )
        
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
      .onAppear {
        if selected {
          animating.toggle()
        }
      }
    }
  }
}

// TODO: Animate!
struct Persona5AnimatedMenu: View {
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        Color.red.ignoresSafeArea()
        VStack {
          Persona5MenuItem(selected: true, text: "nope")
            .frame(width: dim / 2, height: dim / 4)
          
          Persona5MenuItem(text: "persona5")
            .frame(width: dim / 2, height: dim / 4)
          
          Persona5MenuItem(text: "5")
            .frame(width: dim / 2, height: dim / 4)
          
          Spacer()
          
          P5AnimatedStarParty()
            .frame(width: dim, height: dim * 0.5)
            .drawingGroup()

        }
        
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct Persona5AnimatedMenu_Previews: PreviewProvider {
  static var previews: some View {
    Persona5AnimatedMenu()
  }
}
