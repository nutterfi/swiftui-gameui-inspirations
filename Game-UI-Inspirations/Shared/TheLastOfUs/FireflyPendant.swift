//
//  FireflyPendant.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 4/24/21.
//

import SwiftUI

struct FireflyDemo: View {
  @State private var control: CGFloat = 0.1

  var body: some View {
    VStack {
      Slider(value: $control)
      FireflyPendant(control: control, rustStyle: RustifyStyle.one)
      FireflyPendant(control: control, rustStyle: RustifyStyle.two)
      FireflyPendant(control: control, rustStyle: RustifyStyle.three)
    }
  }
  
}

struct FireflyPendant: View {
    var control: CGFloat = 0.1
    var rustStyle: String = RustifyStyle.one
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          Circle()
            .foregroundColor(.gray)
          Circle()
            .stroke(Color.black, lineWidth: 2)
            .frame(width: dim * 0.9)
          
          Circle()
            .fill(Color.black)
            .frame(width: dim * 0.07)
            .offset(x: 0, y: -dim * 0.35)
          HStack {
            FireflyWing()
            FireflyWing()
              .scale(x: -1, y: 1)
          }
          .frame(width: dim * 0.75, height: dim * 0.25)
          .offset(x: 0, y: -dim * 0.1)
          
          HStack {
            FireflyTail()
            FireflyTail()
              .scale(x: -1, y: 1)
          }
          .frame(width: dim * 0.2, height: dim * 0.4)
          .offset(x: 0, y: dim * 0.13)
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
        .overlay(
          Rustify(blur: control * 100,                         style: rustStyle)
            .frame(width: proxy.size.width, height: proxy.size.height)
        )
        .mask(Circle())
      }
    }
}

struct FireflyPendant_Previews: PreviewProvider {
    static var previews: some View {
      FireflyDemo()
    }
}
