//
//  FireflyPendant.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 4/24/21.
//

import SwiftUI

struct FireflyPendantDemo: View {
  @State private var rustLevel: CGFloat = 0.1

  var body: some View {
    VStack {
      Slider(value: $rustLevel)
      FireflyPendant(rustLevel: rustLevel, rustStyle: RustifyStyle.one)
      FireflyPendant(rustLevel: rustLevel, rustStyle: RustifyStyle.two)
      FireflyPendant(rustLevel: rustLevel, rustStyle: RustifyStyle.three)
    }
    .padding()
  }
  
}

struct FireflyPendant: View {
    var rustLevel: CGFloat = 0.1
    var rustStyle: String = RustifyStyle.one
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          Circle()
            .foregroundColor(.gray)
          Circle()
            .stroke(Color.black, lineWidth: 2)
            .frame(width: dim * 0.9)
          
          
          FireflySymbol()
            .overlay(
              Rustify(blur: rustLevel * 100,                         style: rustStyle)
                .mask(Circle())
            )
          
          // pendant hole
          Circle()
            .fill(Color.black)
            .frame(width: dim * 0.07)
            .offset(x: 0, y: -dim * 0.35)
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct FireflyPendant_Previews: PreviewProvider {
    static var previews: some View {
      FireflyPendantDemo()
    }
}
