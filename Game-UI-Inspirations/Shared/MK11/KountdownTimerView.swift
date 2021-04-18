//
//  KountdownTimerView.swift
//
//  Created by nutterfi on 3/11/21.
//

import SwiftUI

struct KountdownTimerView: View {
  @StateObject private var viewModel = KountdownTimerViewModel()
  
    var body: some View {
      GeometryReader { proxy in
        let width = proxy.size.width
        let height = proxy.size.height
        let dim = min(width, height)
        ZStack {
          Circle()
            .stroke(Color.gray, lineWidth: 5)
            .frame(width: dim * 0.95, height: dim * 0.95)
          Circle()
            .frame(width: dim * 0.9, height: dim * 0.9)
            .foregroundColor(.yellow)
            .overlay(
              Circle()
                .frame(width: dim * 0.8, height: dim * 0.8)
                .opacity(0.8)
                .blur(radius: 10)
            )
          
          
          Text("\(viewModel.count)")
            .foregroundColor(.white)
            .font(.system(size: dim / 2))
        }
        .frame(width: width, height: height)
      }
      .border(Color.black)
    }
}

struct CountdownTimerView_Previews: PreviewProvider {
    static var previews: some View {
      ZStack {
        Color.black
        KountdownTimerView()
          .frame(width: 200, height: 200)
      }
    }
}
