//
//  MotionDemo.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 2/1/22.
//

import SwiftUI
import Shapes

struct MotionDemo: View {
  @State private var duration: CGFloat = 10
  @State private var scale: CGFloat = 0.01
  @State private var useGravity: Bool = true

  var velocity = 1.0
  var body: some View {
    VStack {
      Group {
        HStack {
          Text("Duration")
          Slider(value: $duration, in: 0.1...10.0)
        }
        HStack {
          Text("Scale")
          Slider(value: $scale)
        }
        Toggle("Use Gravity", isOn: $useGravity)
      }
        .zIndex(1000)
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          Color.black.ignoresSafeArea()
          let rect = proxy.frame(in: .local)

          let path = StarPolygon(points: 5, density: 2)
            .path(in: rect)
          let points = path.positions(dividedBy: 400)

          ForEach(0..<points.count) { index in
            let vertex = points[index]
            Circle()
              .frame(width: dim * scale, height: dim * scale)
              .foregroundColor(.spiderManTeal)
              .blendMode(.plusLighter)
              .offset(x: dim * -0.5 + vertex.x, y: rect.height * -0.5 + vertex.y)
              .modifier(
                Motion(duration: duration,
                       useGravity: useGravity,
                       velocity: Double(velocity) * Double.random(in: -10...10)
                      )
              )
          }

        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
  }
}

struct MotionDemo_Previews: PreviewProvider {
  static var previews: some View {
    MotionDemo()
  }
}
