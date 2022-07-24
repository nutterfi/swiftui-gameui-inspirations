//
//  RDR2MinimapDemo.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 3/13/21.
//

import SwiftUI

struct RDR2MinimapDemo: View {
  @State private var rotation: CGFloat = 0
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          LinearGradient(colors: [.hadesArtemisGreen, .kombatBrown], startPoint: .topTrailing, endPoint: .bottom)
            .ignoresSafeArea()
          
          VStack() {
            Slider(value: $rotation, in: 0...360)
            Spacer()
            RDR2HUD(mapRotation: .degrees(rotation))
              .frame(width: dim * 0.8, height: dim * 0.8)
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
      RDR2MinimapDemo()
    }
}
