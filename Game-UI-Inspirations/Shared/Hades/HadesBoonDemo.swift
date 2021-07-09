//
//  HadesBoonDemo.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 7/1/21.
//

import SwiftUI

struct HadesBoonDemo: View {
  
  @State private var boons: [String] = [
    Boon.zeus, Boon.poseidon, Boon.athena, Boon.aphrodite, Boon.artemis, Boon.ares, Boon.dionysis, Boon.hermes, Boon.chaos, Boon.demeter]
  @State private var selectedIndex = 0
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          LinearGradient(colors: [.kombatBrown, .red, .hadesZeusOrange], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
          
          VStack {
            BoonView(boon: boons[selectedIndex])
              .background(Color.black.opacity(0.3).mask(Circle()))
                .padding()
            Text("\(boons[selectedIndex])".uppercased())
              .font(.largeTitle)
              .foregroundColor(.primary)
              
            ScrollView(.horizontal) {
              LazyHStack {
                ForEach(0..<boons.count) { index in
                  BoonView(boon: boons[index])
                    .background(Color.black.opacity(0.3).mask(Circle()))
                    .frame(width: dim / 4, height: dim / 4)
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
        .preferredColorScheme(.light)
    }
}
