//
//  ContentView.swift
//  rdr2-map-overlay
//
//  Created by nutterfi on 3/13/21.
//

import SwiftUI

struct MinimapDemo: View {
  @State private var rotation: CGFloat = 0
    var body: some View {
      VStack() {
        Slider(value: $rotation)
        Spacer()
        MinimapView()
          .frame(width: 250, height: 200)
          .rotationEffect(.degrees(360.0 * Double(rotation)))
        Spacer()
      }
      .padding()
    }
}

struct MinimapDemo_Previews: PreviewProvider {
    static var previews: some View {
      MinimapDemo()
    }
}
