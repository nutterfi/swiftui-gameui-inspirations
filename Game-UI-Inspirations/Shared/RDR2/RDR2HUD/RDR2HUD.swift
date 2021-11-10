//
//  RDR2HUD.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 11/9/21.
//

import SwiftUI

struct RDR2HUD: View {
  
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          LinearGradient(colors: [.hadesArtemisGreen, .kombatBrown], startPoint: .topTrailing, endPoint: .bottom)
            .ignoresSafeArea()
          
          MinimapView()
            .frame(width: dim * 0.75, height: dim * 0.75)
            .offset(x: 0, y: dim * 0.08)
          RDR2HUDCoreMenu()
          
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct RDR2HUD_Previews: PreviewProvider {
    static var previews: some View {
      RDR2HUD()
        .frame(width: 256, height: 256)
        .previewLayout(.sizeThatFits)
    }
}
