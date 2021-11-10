//
//  Rustify.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 4/29/21.
//

import SwiftUI

struct RustifierStyle {
  static let one = "lasso.sparkles"
  static let two = "trash.circle.fill"
  static let three = "paperplane.fill"
}

struct Rustifier: ViewModifier {
  
  var blur: CGFloat = .zero
  var startRadius: CGFloat = 0.2
  var endRadius: CGFloat = 1.0
  var style: String = RustifierStyle.one

  func body(content: Content) -> some View {
    GeometryReader { proxy in
      let dim = max(proxy.size.width, proxy.size.height)
      ZStack {
        content
          .overlay(
            RadialGradient(gradient: Gradient(colors: [.kombatBrown, .green]), center: .center, startRadius: dim * startRadius, endRadius: dim * endRadius)
              .mask(
                Image(systemName: style)
                  .resizable()
                  .scaledToFit()
                  .blur(radius: blur)
              )
              .mask(content)
          )
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

extension View {
  func rustify(blur: CGFloat, style: String) -> some View {
    modifier(Rustifier(blur: blur, style: style))
  }
}
