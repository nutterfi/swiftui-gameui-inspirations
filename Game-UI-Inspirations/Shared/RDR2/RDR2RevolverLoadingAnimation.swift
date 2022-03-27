//
//  RDR2RevolverLoadingAnimation.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 10/23/21.
//

import SwiftUI

struct RDR2RevolverLoadingView: View {
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack() {
        Color.black.ignoresSafeArea()
        VStack {
          Spacer()
          HStack {
            Spacer()
            RDR2RevolverLoadingAnimation()
              .foregroundColor(Color.white)
              .frame(width: dim / 5, height: dim / 5)
          }
        }
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct RDR2RevolverLoadingAnimation: View {
  @State private var isAnimating = false
    var body: some View {
      RDR2Revolver()
        .clipShape(Circle().inset(by: 1))
        .rotationEffect(isAnimating ? .radians(.pi / 4) : .zero)
        .onAppear {
          withAnimation(Animation.spring().delay(0.25).repeatForever(autoreverses: false)) {
            isAnimating.toggle()
          }
        }
    }
}

struct RDR2RevolverLoadingAnimation_Previews: PreviewProvider {
    static var previews: some View {
      RDR2RevolverLoadingView()
    }
}
