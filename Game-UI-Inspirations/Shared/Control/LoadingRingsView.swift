//
//  ContentView.swift
//  Control-Loading-Animations
//
//  Created by nutterfi on 3/2/21.
//

import SwiftUI

struct LoadingRingsView: View {
  @StateObject private var viewModel = LoadingRingsViewModel()
  var color: Color
  var lineWidth: CGFloat
  
  var body: some View {
    GeometryReader { proxy in
      let width = proxy.size.width
      let height = proxy.size.height
      ZStack {
        Circle()
          .trim(from: viewModel.innerTrimFrom, to: viewModel.innerTrimTo)
          .stroke(color, lineWidth: lineWidth)
          .frame(width: width * 0.25, height: height * 0.25)
          .rotationEffect(Angle(radians: Double(viewModel.innerRotation)))
        
        Circle()
          .trim(from: viewModel.middleTrimFrom, to: viewModel.middleTrimTo)
          .stroke(color, lineWidth: lineWidth)
          .frame(width: width * 0.5, height: height * 0.5)
          .rotationEffect(Angle(radians: Double(viewModel.middleRotation)))
        
        Circle()
          .trim(from: viewModel.outerTrimFrom, to: viewModel.outerTrimTo)
          .stroke(color, lineWidth: lineWidth)
          .frame(width: width * 0.75, height: height * 0.75)
          .rotationEffect(Angle(radians: Double(viewModel.outerRotation)))
      }
      .frame(width: width, height: height)
    }
    .animation(.easeInOut(duration: 0.1))
    
  }
  
}

struct LoadingRingsView_Previews: PreviewProvider {
  static var previews: some View {
    LoadingRingsView(color: .purple, lineWidth: 10)
  }
}
