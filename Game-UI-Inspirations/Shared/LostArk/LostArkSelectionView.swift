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
        
        Diamond()
          .stroke(embossColor, lineWidth: dim * 0.05)
          .frame(width: dim * 0.9, height: dim * 0.9)
          
        Diamond()
          .inset(by: dim * 0.1)
          .stroke(embossColor, lineWidth: dim * 0.02)
          .frame(width: dim * 0.9, height: dim * 0.9)

        LostArkLogo()
          .frame(width: dim * 0.9, height: dim * 0.9)
          .foregroundColor(embossColor)
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct LostArkSelectionView_Previews: PreviewProvider {
  static var previews: some View {
    LostArkSelectionView()
      .frame(width: 256, height: 64)
      .previewLayout(.sizeThatFits)
  }
}
