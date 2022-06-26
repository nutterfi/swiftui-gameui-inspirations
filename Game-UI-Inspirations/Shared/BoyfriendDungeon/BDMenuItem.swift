//
//  BDMenuItem.swift
//  Game-UI-Inspirations (iOS)
//
//  Created by nutterfi on 6/25/22.
//

import SwiftUI
import Shapes

struct BDMenuItem: View {
  @State private var animating = false
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        CutCornerRectangle(cutLength: dim * 0.1)
          .foregroundColor(.randomBlue)
        CutCornerRectangle(cutLength: dim * 0.1)
          .stroke(lineWidth: 10)
        
        CutCornerRectangle(corners: [.topLeft: dim * 0.1, .bottomRight: dim * 0.2])
          .inset(by: dim * 0.1)
          .stroke(lineWidth: 5)
          .overlay(
            Image(systemName: "heart.fill")
              .resizable()
              .scaledToFit()
              .padding(dim * 0.2)
              .foregroundColor(.red)
          )
          .scaleEffect(animating ? 0.85 : 1)
          .animation(Animation.easeInOut(duration: 2).repeatForever(), value: animating )
      }
      .task {
        animating = true
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct BDMenuItem_Previews: PreviewProvider {
  static var previews: some View {
    BDMenuItem()
      .frame(width: 200, height: 300)
  }
}
