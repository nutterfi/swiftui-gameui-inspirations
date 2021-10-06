//
//  Destiny2FastTravelView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 9/23/21.
//

import SwiftUI

struct Destiny2FastTravelView: View {
    var body: some View {
      GeometryReader { proxy in
        ZStack {
          LinearGradient(colors: [.black, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
          
          LinearGradient(colors: [.white, .black], startPoint: .bottom, endPoint: .top)
            .opacity(0.6)
            .ignoresSafeArea()
          
          Destiny2FastTravelIcon(color: .white)
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct Destiny2FastTravelView_Previews: PreviewProvider {
    static var previews: some View {
      Destiny2FastTravelView()
        .previewDevice("iPad mini (6th generation)")
.previewInterfaceOrientation(.landscapeLeft)
    }
}
