//
//  SpirolateralAnimationDemo.swift
//  
//
//  Created by nutterfi on 10/7/21.
//

import SwiftUI
import Shapes

struct SpirolateralAnimationDemo: View {
  @State private var isAnimating: Bool = false
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
            LinearGradient(colors: [.black, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
              .ignoresSafeArea()
            
            LinearGradient(colors: [.white, .black], startPoint: .bottom, endPoint: .top)
              .opacity(0.6)
              .ignoresSafeArea()
          let rg = RadialGradient(colors: [.white, .purple], center: .center, startRadius: 0, endRadius: dim)
          
          Spirolateral(turns: [6], turningAngle: isAnimating ? 62 : 61, repetitions: 52, reversedIndexes: [2, 5])
            .stroke()
            .fill(rg, style: .init(eoFill: true, antialiased: true))
            .frame(width: dim, height: dim)
            .scaleEffect(isAnimating ? 3 : 1)
            .rotationEffect(.degrees(isAnimating ? 360 : 0))
            .animation(Animation.easeInOut(duration: 10).repeatForever(), value: isAnimating)
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
      .onAppear {
        isAnimating.toggle()
      }
      
    }
}

struct SpirolateralAnimationDemo_Previews: PreviewProvider {
    static var previews: some View {
      SpirolateralAnimationDemo()
        .drawingGroup()
        .ignoresSafeArea()
    }
}
