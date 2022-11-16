//
//  MirroredText2Demo.swift
//  Game-UI-Inspirations (iOS)
//
//  Created by nutterfi on 10/27/22.
//

import SwiftUI

struct MirroredText2Demo: View {
  @State private var transform: CGAffineTransform = .identity
  let dimension: CGFloat = 100
  
  var body: some View {
    VStack {
      SliderLabelView(value: $transform.a, label: "A", range: -1...1)
      SliderLabelView(value: $transform.b, label: "B", range: -1...1)
      SliderLabelView(value: $transform.c, label: "C", range: -1...1)
      SliderLabelView(value: $transform.d, label: "D", range: -1...1)
      SliderLabelView(value: $transform.tx, label: "Tx", range: -dimension...dimension)
      SliderLabelView(value: $transform.ty, label: "Ty", range: -dimension...dimension)
      
      Button {
        transform = .identity
      } label: {
        Text("Reset")
      }
      
      Spacer()
      
      ZStack {
        Text("WAKE")
          .font(.system(size: 80))
        Text("WAKE")
          .font(.system(size: 80))
          .transformEffect(transform)
      }
    }
  }
}

struct MirroredText2Demo_Previews: PreviewProvider {
  static var previews: some View {
    MirroredText2Demo()
  }
}
