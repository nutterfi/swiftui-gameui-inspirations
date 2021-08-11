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
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          LinearGradient(colors: [.hadesArtemisGreen, .kombatBrown], startPoint: .topTrailing, endPoint: .bottom)
            .ignoresSafeArea()
          
          VStack() {
            Slider(value: $rotation)
            Spacer()
            MinimapView()
              .frame(width: dim * 0.8, height: dim * 0.8)
              .rotationEffect(.degrees(360.0 * Double(rotation)))
            Spacer()
          }
          .padding()
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
      
    }
}

struct MinimapDemo_Previews: PreviewProvider {
    static var previews: some View {
      MinimapDemo()
    }
}
