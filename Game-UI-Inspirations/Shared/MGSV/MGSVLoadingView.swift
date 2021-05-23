//
//  MGSVLoadingView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/22/21.
//

import SwiftUI

struct MGSVLoadingView: View {
    @StateObject private var viewModel = MGSVLoadingViewModel()
    var color: Color
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          let gradient = AngularGradient(gradient: Gradient(colors: [color, Color.clear]), center: .center, startAngle: .degrees(0), endAngle: .degrees(270))
          
          // Outer Arcs
          Circle()
            .trim(from: 0.0, to: 0.15)
            .stroke(color, lineWidth: dim * 0.02)
            .frame(width: dim * 0.9, height: dim * 0.9)
            .rotationEffect(Angle(radians: Double(viewModel.outerRotation)))
          
          Circle()
            .trim(from: 0.5, to: 0.65)
            .stroke(color, lineWidth: dim * 0.02)
            .frame(width: dim * 0.9, height: dim * 0.9)
            .rotationEffect(Angle(radians: Double(viewModel.outerRotation)))
          
          // Inner Circle
          Circle()
            .stroke(gradient, lineWidth: dim * 0.12)
            .frame(width: dim * 0.65, height: dim * 0.65)
            .rotationEffect(Angle(radians: Double(viewModel.innerRotation)))
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct MGSVLoadingView_Previews: PreviewProvider {
    static var previews: some View {
      ZStack {
        MGSVLoadingView(color: .orange)
      }
      .background(Color.black)
    }
}
