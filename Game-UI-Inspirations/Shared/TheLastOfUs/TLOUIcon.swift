//
//  TLOUIcon.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 4/20/21.
//

import SwiftUI
import Shapes

struct TLOUIcon: View {
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          Rectangle()
            .stroke(Color.gray, lineWidth: dim / 30)
            .frame(width: dim, height: dim)
          UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 100, bottomTrailing: 100))
            .frame(width: dim * 0.85, height: dim * 0.85)
            .foregroundColor(.tlouSecondary)
          
          Circle()
            .frame(width: dim * 0.73, height: dim * 0.73)
          Image(systemName: "hand.raised.fill")
            .resizable()
            .scaledToFit()
            .frame(width: dim * 0.5, height: dim * 0.5)
            .foregroundColor(.tlouSecondary)
        }
        .background(Color(red: 46.0/255, green: 47.0/255, blue: 45.0/255))
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct TLOUIcon_Previews: PreviewProvider {
    static var previews: some View {
        TLOUIcon()
          .frame(width: 200, height: 300)
          .padding()
    }
}
