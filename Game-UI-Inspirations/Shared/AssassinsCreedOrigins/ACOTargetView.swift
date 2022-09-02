//
//  ACOTargetView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 8/27/22.
//

import SwiftUI
import Shapes

struct ACOTargetView: View {
  @State private var focus: Float = 0.5
  @State private var animating = false
  var body: some View {
    VStack {
      Slider(value: $focus, in: 0.25 ... 0.9)
      
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          Color.black
          Circle()
            .inset(by: CGFloat(1.0 - focus) * 0.7 * dim)
            .stroke(lineWidth: 3)
            .foregroundColor(.yellow)
          
          Circle()
            .inset(by: CGFloat(1.0 - focus) * 0.8 * dim)
            .stroke(lineWidth: 1)
            .foregroundColor(.yellow)
          
          
          Circle()
            .inset(by: CGFloat(1.0 - focus * 0.6) * 0.5 * dim)
            .trim(from: 0, to: 0.75)
            .stroke(lineWidth: 10)
            .foregroundColor(.yellow)
            .rotationEffect(animating ? .degrees(-360) : .zero)
            .animation(
              Animation.linear(duration: 20)
                .repeatForever(autoreverses: false),
              value: animating
            )
          
          Circle()
            .inset(by: CGFloat(1.0 - focus * 0.8) * 0.6 * dim)
            .trim(from: 0, to: 0.75)
            .stroke(lineWidth: 1)
            .opacity(focus > 0.5 ? 0 : Double(focus))
            .foregroundColor(.yellow)
            .rotationEffect(animating ? .degrees(-360) : .zero)
            .animation(
              Animation.linear(duration: 20)
                .repeatForever(autoreverses: false),
              value: animating
            )
          
          
          StrokeStyledCircle(
            numberOfSegments: 100,
            dashPattern: [1, 3],
            lineWidthRatio: 0.01
          )
          .foregroundColor(.yellow)
          .rotationEffect(animating ? .degrees(360) : .zero)
          .animation(
            Animation.linear(duration: 45)
              .repeatForever(autoreverses: false),
            value: animating
          )
          .frame(width: dim * CGFloat(focus), height: dim * CGFloat(focus))
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
    .task {
      animating.toggle()
    }
  }
}

struct ACOTargetView_Previews: PreviewProvider {
  static var previews: some View {
    ACOTargetView()
      .previewLayout(.sizeThatFits)
  }
}
