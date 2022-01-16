//
//  ViewModifier+Extensions.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 11/9/21.
//

import SwiftUI
import Shapes

struct AngularOffset: ViewModifier {
  var magnitude: CGFloat
  var angle: Angle
  
  func body(content: Content) -> some View {
    let x = magnitude * cos(angle.radians)
    let y = magnitude * sin(angle.radians)
    content
      .offset(x: x, y: y)
  }
}

extension View {
  func angularOffset(magnitude: CGFloat, angle: Angle) -> some View {
    modifier(AngularOffset(magnitude: magnitude, angle: angle))
  }
}

struct ColorInvertedOverlay<T>: ViewModifier where T: View {
  var mask: T
  
  func body(content: Content) -> some View {
    content
      .background(
        mask
      )
      .overlay(
        content
          .colorInvert()
          .mask(mask)
      )
  }
}

extension View {
  func colorInvertedOverlay<T: View>(overlay: T) -> some View {
    modifier(ColorInvertedOverlay(mask: overlay))
  }
}

struct TempColorInvert: View {
  @State private var animating: Bool = false
  @State private var color: Color = .red
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        Color.black.ignoresSafeArea()
        Text("Hello World")
          .font(.system(size: 80))
          .foregroundColor(color)
          .colorInvertedOverlay(
            overlay: Parallelogram(pct: 0.35)
              .frame(width: dim, height: dim * 0.25)
              .foregroundColor(Color.purple)
              .rotation3DEffect(animating ? .zero : .degrees(20), axis: (x: 1.3, y: 0.8, z: 0))
              .animation(
                Animation
                  .easeInOut(duration: 0.15)
                  .repeatForever(),
                value: animating
              )
          )
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
    .onAppear {
      animating.toggle()
    }
  }
}

struct Temp_Previews: PreviewProvider {
  static var previews: some View {
    TempColorInvert()
.previewInterfaceOrientation(.landscapeLeft)
  }
}
