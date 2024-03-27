//
//  DragonCurveBox.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 12/22/21.
//

import SwiftUI
import Shapes
struct DragonCurveBox: View {
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          Color.orange
          DragonCurve(steps: 8, angleDegrees: 90)
            .strokeBorder(Color.red, lineWidth: 5)

          DragonCurve(steps: 5, angleDegrees: 90)
            .strokeBorder(Color.yellow, lineWidth: 5)
            .rotationEffect(.degrees(90))
          
          DragonCurve(steps: 7, angleDegrees: 60)
            .strokeBorder(Color.black, lineWidth: 5)
            .rotationEffect(.degrees(180))
          
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct DragonCurveBox_Previews: PreviewProvider {
    static var previews: some View {
        DragonCurveBox()
      .frame(width: 256, height: 256)
    }
}
