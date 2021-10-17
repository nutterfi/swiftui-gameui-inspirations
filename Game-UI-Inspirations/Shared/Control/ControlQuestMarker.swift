//
//  ControlQuestMarker.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 4/17/21.
//

import SwiftUI
import Shapes

struct ControlQuestMarker: View {
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          let lineWidth = max(dim * 0.02, 1)
          ConvexPolygon(sides: 4)
            .inset(by: lineWidth)
            .stroke(Color.controlYellow, lineWidth: lineWidth)

          ConvexPolygon(sides: 4)
            .inset(by: dim * 0.3)
            .fill(Color.controlYellow)
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct ControlQuestMarker_Previews: PreviewProvider {
    static var previews: some View {
      ControlQuestMarker()
        .previewLayout(.sizeThatFits)
          .frame(width: 15, height: 15)
          .background(Color.black)
    }
}
