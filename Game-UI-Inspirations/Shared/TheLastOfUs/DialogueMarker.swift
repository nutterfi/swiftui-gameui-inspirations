//
//  DialogueMarker.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 4/22/21.
//

import SwiftUI
import Shapes

struct DialogueMarker: View {
    var body: some View {
      let inset: CGFloat = 0.8
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          Teardrop()
            .rotation(Angle(radians: .pi))
            .blur(radius: 5.0)
            .frame(width: proxy.size.width, height: proxy.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
          
          Teardrop()
            .rotation(Angle(radians: .pi))
            .stroke(Color.tlouSecondary, lineWidth: 5)
            .frame(width: proxy.size.width * inset, height: proxy.size.height * inset, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
          
          Crescent()
            .fill(Color.tlouSecondary)
            .frame(width: proxy.size.width * 0.4, height: proxy.size.height * 0.3)
            .scaleEffect(-1)
            .offset(x: -dim / 4, y: dim / 10)
          
          Crescent()
            .fill(Color.tlouSecondary)
            .frame(width: proxy.size.width * 0.4, height: proxy.size.height * 0.3)
            .scaleEffect(-0.8)
            .offset(x: -dim / 16, y: dim / 10)
          
          Crescent()
            .fill(Color.tlouSecondary)
            .frame(width: proxy.size.width * 0.4, height: proxy.size.height * 0.3)
            .scaleEffect(-0.5)
            .offset(x: dim / 8, y: dim / 10)
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct DialogueMarker_Previews: PreviewProvider {
    static var previews: some View {
      ZStack {
        Color.blue.ignoresSafeArea()
        DialogueMarker()
          .frame(width: 200, height: 180)
      }
    }
}
