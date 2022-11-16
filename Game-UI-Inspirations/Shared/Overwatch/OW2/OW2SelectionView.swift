//
//  OW2SelectionView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 11/15/22.
//

import SwiftUI

struct OW2SelectionView: View {
  var body: some View {
    ZStack {
      Color.ow2BackgroundBlue
      HStack {
        OverwatchIcon(primary: Color.ow2Orange, secondary: Color.white)
          .frame(width: 128)
        Color.ow2Orange
          .cornerRadius(12)
          .overlay(
            Text("2")
              .font(.system(size: 60))
              .foregroundColor(Color.white)
          )
          .frame(width: 64)
        
      }
    }
  }
}
