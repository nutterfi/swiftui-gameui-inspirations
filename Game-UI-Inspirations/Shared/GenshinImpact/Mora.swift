//
//  Mora.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 10/21/21.
//

import SwiftUI
import Shapes

struct Mora: View {
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          Circle()
            .foregroundColor(Color("giGold"))
          
          Circle()
            .inset(by: dim * 0.1)
            .stroke(Color("giBrown"), lineWidth: dim * 0.03)
          
          Torx(sides: 3, controlPointRatio: 0.35)
            .inset(by: dim * 0.15)
            .stroke(Color("giBrown"), lineWidth: dim * 0.02)
            .rotationEffect(.radians(.pi))

          TriquetraView(lineWidth: dim * 0.1)
            .scaleEffect(0.8)
            .foregroundColor(Color("giGold"))
            .shadow(color: Color("giBrown"), radius: 5, x: 2, y: 2)
            .offset(x: 0, y: -dim * 0.08)
          
        }
        .overlay(
          LinearGradient(colors: [Color("giGold"), Color("giBronze")], startPoint: .topLeading, endPoint: .bottomTrailing)
            .rotationEffect(.degrees(25))
            .scaleEffect(1.2)
            .opacity(0.6)
            .clipShape(Circle())
        )
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct Mora_Previews: PreviewProvider {
    static var previews: some View {
      
        ZStack {
          Circle().foregroundColor(.white)
            .frame(width: 500, height: 500)
          Mora().frame(width: 480, height: 480)
        }
        .frame(width: 512, height: 512)
      
      .background(Color.black)
      .previewLayout(.sizeThatFits)
    }
}
