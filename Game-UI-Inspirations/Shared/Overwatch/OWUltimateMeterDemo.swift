//
//  OWUltimateMeterDemo.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 7/10/21.
//

import SwiftUI

struct OWUltimateMeterDemo: View {
  @State private var progress: Float = 0
  
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        Color.black.ignoresSafeArea()
        Group {
          LinearGradient(colors: [.red, .yellow], startPoint: .topTrailing, endPoint: .bottom)
            .ignoresSafeArea()

          RadialGradient(gradient: Gradient(colors: [.white, .black]), center: .bottom, startRadius: dim / 4, endRadius: dim)
            .ignoresSafeArea()
            .opacity(0.4)

          StrokeStyledCircle(
            numberOfSegments: 20,
            segmentRatio: 0.5,
            lineWidthRatio: 0.5)
            .foregroundColor(.blue)
            .scaleEffect(2.5)
        }
        .opacity(0.1)
        
        VStack() {
          Slider(value:$progress)
          Spacer()
          OWUltimateMeter(progress: $progress)
            .frame(width: dim * 0.8, height: dim * 0.8)
          Spacer()
        }
        .padding()

      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct OWUltimateMeterDemo_Previews: PreviewProvider {
  static var previews: some View {
    OWUltimateMeterDemo()
  }
}
