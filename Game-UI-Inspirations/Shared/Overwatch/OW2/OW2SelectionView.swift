//
//  OW2SelectionView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 11/15/22.
//

import SwiftUI

struct OW2SelectionView: View {
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        Color.ow2BackgroundBlue
        HStack {
          OverwatchIcon(primary: Color.ow2Orange, secondary: Color.white)
            .frame(width: dim * 0.6)
          Color.ow2Orange
            .cornerRadius(12)
            .overlay(
              Text("2")
                .font(.system(size: 60))
                .minimumScaleFactor(0.5)
                .foregroundColor(Color.white)
            )
            .frame(width: dim * 0.25, height: dim * 0.6)
          
        }
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}
