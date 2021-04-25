//
//  FireflyPendant.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 4/24/21.
//

import SwiftUI

struct FireflyPendant: View {
    var body: some View {
      GeometryReader { proxy in
        ZStack {
          Circle()
            .foregroundColor(.gray)
          Circle()
            .stroke(Color.black, lineWidth: 2)
            .frame(width: proxy.size.width * 0.9)
          
          Circle()
            .fill(Color.black)
            .frame(width: proxy.size.width * 0.07)
            .offset(x: 0, y: -proxy.size.width * 0.35)
          HStack {
            FireflyWing()
            FireflyWing()
              .scale(x: -1, y: 1)
          }
          .frame(width: proxy.size.width * 0.75, height: proxy.size.width * 0.25)
          .offset(x: 0, y: -proxy.size.width * 0.1)
          
          HStack {
            FireflyTail()
            FireflyTail()
              .scale(x: -1, y: 1)
          }
          .frame(width: proxy.size.width * 0.2, height: proxy.size.width * 0.4)
          .offset(x: 0, y: proxy.size.width * 0.13)
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct FireflyPendant_Previews: PreviewProvider {
    static var previews: some View {
        FireflyPendant()
    }
}
