//
//  HadesBoonDemo.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 7/1/21.
//

import SwiftUI

struct HadesBoonDemo: View {
  
  @State private var boons: [String] = [
    Boon.zeus, Boon.poseidon, Boon.artemis, Boon.aphrodite, Boon.ares, Boon.chaos, Boon.hermes]
  @State private var selectedIndex = 0
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          VStack {
            BoonView(boon: boons[selectedIndex])
              .background(Color.blue.mask(Circle()))
                .padding()
            ScrollView(.horizontal) {
              LazyHStack {
                ForEach(0..<boons.count) { index in
                  BoonView(boon: boons[index])
                    .background(Color.blue.mask(Circle()))
                    .frame(width: dim / 5, height: dim / 4)
                      .overlay(Circle().stroke(Color.purple, lineWidth: selectedIndex == index ? 5 : 0))
                    .onTapGesture {
                      selectedIndex = index
                    }
                }
              }
            }
          }
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct HadesBoonDemo_Previews: PreviewProvider {
    static var previews: some View {
        HadesBoonDemo()
    }
}
