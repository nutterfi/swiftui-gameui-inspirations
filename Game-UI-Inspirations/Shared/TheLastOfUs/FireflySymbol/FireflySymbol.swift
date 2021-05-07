//
//  FireflySymbol.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/7/21.
//

import SwiftUI

struct FireflySymbol: View {
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          HStack {
            FireflyWing()
            FireflyWing()
              .scale(x: -1, y: 1)
          }
          .frame(width: dim * 0.75, height: dim * 0.25)
          .offset(x: 0, y: -dim * 0.1)
          
          HStack {
            FireflyTail()
            FireflyTail()
              .scale(x: -1, y: 1)
          }
          .frame(width: dim * 0.2, height: dim * 0.4)
          .offset(x: 0, y: dim * 0.13)
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct FireflySymbol_Previews: PreviewProvider {
    static var previews: some View {
        FireflySymbol()
          .foregroundColor(.red)
    }
}
