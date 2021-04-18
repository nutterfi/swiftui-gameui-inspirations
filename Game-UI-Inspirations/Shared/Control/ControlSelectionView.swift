//
//  ControlSelectionView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 4/17/21.
//

import SwiftUI

struct ControlSelectionView: View {
    var body: some View {
      GeometryReader { proxy in
        let width = proxy.size.width
        ZStack {
          Text("Control".uppercased())
          .font(.custom("Futura-Bold", size: 36))
          .kerning(-4)
          .foregroundColor(.white)
        }
        .frame(width: width, height: proxy.size.height)
        .background(Color.black)
      }
    }
}

struct ControlSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ControlSelectionView()
          .frame(width: .infinity, height: 50)
    }
}
