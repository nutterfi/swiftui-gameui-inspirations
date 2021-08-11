//
//  OWUltimateReadyView.swift
//  OWUltimateReadyView
//
//  Created by nutterfi on 7/20/21.
//

import SwiftUI

struct OWUltimateReadyView: View {
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          Circle()
            .foregroundColor(.black.opacity(0.3))
            .overlay(
              Circle()
                .stroke(Color.white, lineWidth: dim * 0.05)
            )
            .frame(width: dim * 0.5, height: dim * 0.5)
          
          Circle()
            .stroke(Color(red: 56/255, green: 230/255, blue: 246/255))
            .frame(width: dim * 0.6, height: dim * 0.6)
          
          Image(systemName: "swift")
            .resizable()
            .scaledToFit()
            .foregroundColor(.white)
            .frame(width: dim * 0.3, height: dim * 0.3)
          
          OWUltimateMeterBorder()
            .frame(width: dim, height: dim)

        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct OWUltimateReadyView_Previews: PreviewProvider {
    static var previews: some View {
        OWUltimateReadyView()
        .background(Color.black)
    }
}
