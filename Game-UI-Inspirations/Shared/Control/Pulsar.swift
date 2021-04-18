//
//  PulsatingTriangle.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 4/13/21.
//

import SwiftUI
import Shapes

struct Pulsar: View {
  @State private var scale: CGFloat = 1
  @State private var opacity: Double = 1
  
  var duration: Double = 0.65
  
  var body: some View {
    GeometryReader { proxy in
      let width = proxy.size.width
      let height = proxy.size.height
      let dim = min(width, height)
      
      ZStack {
        Shapes.Polygon(sides: 3)
          .stroke(Color.red, lineWidth: 2)
          .frame(width: scale * dim / 2, height: scale * dim / 2)
          .rotationEffect(Angle(degrees: 90))
          .opacity(opacity)
          .animation(Animation.easeInOut(duration: duration).repeatForever(autoreverses: false)
          )
        
        Shapes.Polygon(sides: 3)
          .fill(Color.red)
          .frame(width: dim / 8, height: dim / 8)
          .rotationEffect(Angle(degrees: 90))
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
      .onAppear {
        scale = 2
        opacity = 0
    }
    }
  }
}

struct PulsatingTriangle_Previews: PreviewProvider {
  static var previews: some View {
    HStack {
      Pulsar(duration: 0.5)
      Pulsar(duration: 1.0)
      Pulsar(duration: 10)
    }
    .background(Color.black)
  }
}
