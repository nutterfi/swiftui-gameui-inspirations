//
//  BatmanSelectionView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 11/25/22.
//

import SwiftUI

struct BatmanSelectionView: View {
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          Color.gray
          Circle()
            .inset(by: dim * 0.05)
            .foregroundColor(.white)
          BatmanLogo()
            .frame(width: dim * 0.9, height: dim * 0.9)
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
      ZStack {
        
      }
    }
}

struct BatmanSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        BatmanSelectionView()
        .frame(width: 256, height: 128)
    }
}
