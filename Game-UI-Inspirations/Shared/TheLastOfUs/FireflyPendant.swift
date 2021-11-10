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
      FireflyPendant(rustLevel: rustLevel, rustStyle: RustifierStyle.one)
      FireflyPendant(rustLevel: rustLevel, rustStyle: RustifierStyle.two)
      FireflyPendant(rustLevel: rustLevel, rustStyle: RustifierStyle.three)
    }
    .padding()
  }
  
}

struct FireflyPendant: View {
    var rustLevel: CGFloat = 0.1
    var rustStyle: String = RustifierStyle.one
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          Circle()
            .frame(width: dim * 0.99)
            .foregroundColor(.gray)
          Circle()
            .stroke(Color.black, lineWidth: 2)
            .frame(width: dim * 0.9)
          
          FireflySymbol()
            .frame(width: dim * 0.9)
          
          // pendant hole
          Circle()
            .fill(Color.black)
            .frame(width: dim * 0.07)
            .offset(x: 0, y: -dim * 0.35)
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
        .rustify(blur: rustLevel * 100, style: rustStyle)
      }
    }
}

struct FireflyPendant_Previews: PreviewProvider {
    static var previews: some View {
      FireflyPendantDemo()
    }
}
