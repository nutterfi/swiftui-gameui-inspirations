//
//  OWUltimateMeterBorder.swift
//  OWUltimateMeterBorder
//
//  Created by nutterfi on 7/21/21.
//

import SwiftUI

struct OWUltimateMeterBorder: View {
  var isReady: Bool = false
  
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        Circle()
          .trim(from: 0, to: 0.94)
          .rotation(.init(degrees: 101))
          .stroke(Color.gray, lineWidth: 2)
          .frame(width: dim * 0.8, height: dim * 0.8)
        Circle()
          .stroke(Color.gray, lineWidth: 2)
          .frame(width: dim * 0.15, height: dim * 0.15)
          .offset(x: 0, y: dim * 0.4)
        Text("Q")
          .font(.custom("AvenirNextCondensed-MediumItalic", size: dim / 9))
          .foregroundColor(Color.gray)
          .offset(x: 0, y: dim * 0.4)
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct OWUltimateMeterBorder_Previews: PreviewProvider {
    static var previews: some View {
        OWUltimateMeterBorder()
    }
}
