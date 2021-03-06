//
//  Rustify.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 4/29/21.
//

import SwiftUI

struct RustifyStyle {
  static let one = "lasso.sparkles"
  static let two = "trash.circle.fill"
  static let three = "paperplane.fill"
}

struct Rustify: View {
  
  var blur: CGFloat
  var startRadius: CGFloat = 0.2
  var endRadius: CGFloat = 1.0
  var style: String = RustifyStyle.one
  
    var body: some View {
      GeometryReader { proxy in
        ZStack {
          RadialGradient(gradient: Gradient(colors: [.kombatBrown, .green]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: proxy.size.width * startRadius, endRadius: proxy.size.width * endRadius)
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
        .mask(
          Image(systemName: style)
            .resizable()
            .scaledToFit()
            .blur(radius: blur)
        )
      }
    }
}

struct Rustify_Previews: PreviewProvider {
    static var previews: some View {
      Rustify(blur: 10)
    }
}
