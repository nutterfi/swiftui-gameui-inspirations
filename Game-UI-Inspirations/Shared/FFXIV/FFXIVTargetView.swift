//
//  FFXIVTargetView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 8/18/22.
//

import SwiftUI
import Shapes

/// WIP - still need to render the arrow portion
struct FFXIVTargetView: View {
  @State private var animating = false
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          Circle()
            .inset(by: dim * 0.021)
            .trim(from: 0.12, to: 0.88)
            .stroke(Color.mokokoYellow, lineWidth: dim * 0.03)
            .rotationEffect(.degrees(90))
          
          Circle()
            .inset(by: dim * 0.15)
            .trim(from: 0.12, to: 0.88)
            .stroke(Color.mokokoYellow, lineWidth: dim * 0.03)
            .rotationEffect(.degrees(90))
          
          
          Arrowhead()
            .stroke(Color.mokokoYellow, lineWidth: dim * 0.02)
            .frame(width: dim * 0.2, height: dim * 0.2)
            .offset(x: dim * 0.25)
          
          Diamond()
            .stroke(Color.mokokoYellow, lineWidth: dim * 0.02)
            .frame(width: dim * 0.05, height: dim * 0.05)
            .offset(x: -dim * 0.25, y: dim * 0.12)
          
          Arrowhead()
            .stroke(Color.mokokoYellow, lineWidth: dim * 0.02)
            .frame(width: dim * 0.2, height: dim * 0.2)
            .offset(x: -dim * 0.25)
          
          Diamond()
            .stroke(Color.mokokoYellow, lineWidth: dim * 0.02)
            .frame(width: dim * 0.05, height: dim * 0.05)
            .offset(x: dim * 0.25, y: dim * 0.12)
          
          
          Circle()
            .inset(by: 1)
            .trim(from: 0, to: 0.25)
            .stroke(Color.mokokoLeafYellow)
            .rotationEffect(animating ? .degrees(360) : .zero)
            .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: animating)
          
          Circle()
            .trim(from: 0.5, to: 0.75)
            .stroke(Color.mokokoLeafYellow)
            .rotationEffect(animating ? .degrees(360) : .zero)
            .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: animating)
          
          
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
        .task {
          animating = true
        }
      }
    }
}

struct FFXIVTargetView_Previews: PreviewProvider {
  static var previews: some View {
    FFXIVTargetView()
      .frame(width: 256, height: 256)
      .previewLayout(.sizeThatFits)
      .background(Color.gray)
  }
}
