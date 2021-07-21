//
//  TestingTiledImageView.swift
//  Game-UI-Inspirations (iOS)
//
//  Created by nutterfi on 7/3/21.
//

import SwiftUI

// We need the "perfect" SF Symbol OR
// we draw our own image which consists of
// 1. define an area 100 x 100
// 2. draw a circle using a CG context
// 3. store as a UIImage or CGImage
// 4. initialize Image with that image
// 5. tile THAT

struct TestingTiledImageView: View {
  @State private var isAnimating = false
    var body: some View {
      let image = Image(systemName: isAnimating ? "dot.squareshape.fill" : "1.circle")
        .resizable()
      
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          Color.yellow.opacity(0.7)
            
            .mask(
              Rectangle()
                .fill(.image(image.renderingMode(.template), sourceRect: CGRect(x: 0, y: 0, width: 1, height: 1), scale: 4))
            )
            .frame(width: dim, height: dim)
            
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
        .background(Color.red)
        
        .onAppear {
          isAnimating = true
        }
      }
      .animation(Animation.easeInOut(duration: 2))
    }
}

struct TestingTiledImageView_Previews: PreviewProvider {
    static var previews: some View {
        TestingTiledImageView()
    }
}
