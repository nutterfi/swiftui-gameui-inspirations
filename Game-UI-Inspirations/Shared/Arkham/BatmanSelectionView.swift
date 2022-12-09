//
//  BatmanSelectionView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 11/25/22.
//

import SwiftUI

struct BatmanSelectionView: View {
    var body: some View {
      ZStack {
        Color.gray
        Circle()
          .foregroundColor(.white)
        BatmanLogo()
          .frame(width: 128)
      }
    }
}

struct BatmanSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        BatmanSelectionView()
        .frame(width: 256, height: 128)
    }
}
