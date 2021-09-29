//
//  CelesteDemo.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 9/28/21.
//

import SwiftUI

struct CelesteDemo: View {
    var body: some View {
      GeometryReader { proxy in
        ZStack {
          CelesteDeathAnimation()
        }
        .background(
          LinearGradient(colors: [.purple, .black], startPoint: .topTrailing, endPoint: .bottomLeading)
        )
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct CelesteDemo_Previews: PreviewProvider {
    static var previews: some View {
        CelesteDemo()
    }
}
