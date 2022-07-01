//
//  LABossAttackAreaAnimation.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 4/12/22.
//

import SwiftUI
import Shapes

/*
 1. Tile Background - DONE
 2. Expanding Shape Area - DONE
 3. Color gradient with some opacity - DONE
 4. Reverse mask on the tiling so that the center tiles are gone
 5. Profit
 */

struct LABossAttackAreaAnimation: View {
  @State private var animating = false
  @State private var image: Image?
  
  var duration = 5.0
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          let mask = Circle()
            .frame(width: animating ? dim : 0.01 * dim, height: animating ? dim : 0.01 * dim)
            .animation(
              Animation.linear(duration: duration).repeatForever(autoreverses: false),
              value: animating
            )
          
          ZStack {
            if let image {
              image
                .resizable(resizingMode: .tile)
                .scaledToFit()
                .frame(width: dim, height: dim)
                .background(Color.red.opacity(0.2))
            }
            
            RadialGradient(colors: [.clear, Color.red.opacity(0.4)], center: .center, startRadius: 0, endRadius: dim * 0.8)
              .animation(
                Animation.linear(duration: duration).repeatForever(autoreverses: false),
                value: animating
              )
          }
          .animation(
            Animation.linear(duration: duration).repeatForever(autoreverses: false),
            value: animating
          )
          .mask(mask)
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
        .task {
          animating = true

          let uiimage = ConvexPolygon(sides: 6)
            .rotation(.degrees(30))
            .stroke(Color.red.opacity(0.5), lineWidth: 5)
            .uiimage(rect: CGRect(origin: .zero, size: CGSize(width: 49, height: 49)))
          
          self.image = Image(uiImage: uiimage)
        }
      
      }
    }
}

struct LABossAttackAreaAnimation_Previews: PreviewProvider {
    static var previews: some View {
        LABossAttackAreaAnimation()
    }
}
