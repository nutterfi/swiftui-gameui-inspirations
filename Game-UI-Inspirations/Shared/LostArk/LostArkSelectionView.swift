//
//  LostArkSelectionView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 4/21/22.
//

import SwiftUI
import Shapes

struct LostArkSelectionView: View {
  var embossColor = Color.white
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
  
        ZStack {
          LinearGradient(colors: [.purple, .black], startPoint: .top, endPoint: .bottom)
            .shadow(color: Color.black.opacity(0.2), radius: dim * 0.1, x: dim * 0.1, y: dim * 0.1)
                        .shadow(color: Color.white.opacity(0.7), radius: dim * 0.1, x: -dim * 0.05, y: -dim * 0.5)
                        .clipShape(Rectangle())
          
          Diamond()
            .stroke(embossColor, lineWidth: dim * 0.05)
            .frame(width: dim, height: dim)
//            .shadow(color: Color.black.opacity(0.2), radius: dim * 0.1, x: dim * 0.1, y: dim * 0.1)
//                        .shadow(color: Color.white.opacity(0.7), radius: dim * 0.1, x: -dim * 0.05, y: -dim * 0.5)
            .padding()
            
          Diamond()
            .inset(by: dim * 0.1)
            .stroke(embossColor, lineWidth: dim * 0.02)
            .frame(width: dim, height: dim)
//            .shadow(color: Color.black.opacity(0.2), radius: dim * 0.1, x: dim * 0.1, y: dim * 0.1)
//                        .shadow(color: Color.white.opacity(0.7), radius: dim * 0.1, x: -dim * 0.05, y: -dim * 0.5)
          
          LostArkLogo()
            .frame(width: dim, height: dim)
            .foregroundColor(embossColor)
//            .shadow(color: Color.black.opacity(0.2), radius: dim * 0.1, x: dim * 0.1, y: dim * 0.1)
//                        .shadow(color: Color.white.opacity(0.7), radius: dim * 0.1, x: -dim * 0.05, y: -dim * 0.5)
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct LostArkSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        LostArkSelectionView()
        .frame(width: 256, height: 256)
    }
}
