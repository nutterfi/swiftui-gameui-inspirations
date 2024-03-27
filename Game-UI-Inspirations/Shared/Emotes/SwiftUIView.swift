//
//  SwiftUIView.swift
//  Game-UI-Inspirations (iOS)
//
//  Created by nutterfi on 11/3/21.
//

import SwiftUI

struct MatrixPill: View {
    var body: some View {
      ZStack {
        Color.black.ignoresSafeArea()
        Group {
        Capsule()
          .fill(.red)
          .frame(width: 128, height: 256)
        
        Capsule()
          .fill(.white)
          .frame(width: 64, height: 512)
          .scaleEffect(0.2)
          .offset(x: -30, y: 0)
        }
        .rotationEffect(.degrees(45))
      }

    }
}

struct MatrixPill_Preview: PreviewProvider {
    static var previews: some View {
      MatrixPill()
    }
}
