//
//  PapersPleaseSettingsIcon.swift
//  Game-UI-Inspirations (iOS)
//
//  Created by nutterfi on 9/17/22.
//

import SwiftUI
import Shapes

struct PapersPleaseSettingsIcon: View {
    var body: some View {
      ZStack {
        Color.black
        StrokeStyledPolygon(
          sides: 12,
          dashes: 48,
          lineWidthRatio: 0.03
        )
          .rotationEffect(.degrees(15))
        Image(systemName: "wrench")
          .resizable()
          .scaledToFit()
          .scaleEffect(0.5)
      }
      .foregroundColor(.porterlightGreen)
    }
}

struct PapersPleaseSettingsIcon_Previews: PreviewProvider {
    static var previews: some View {
        PapersPleaseSettingsIcon()
    }
}
