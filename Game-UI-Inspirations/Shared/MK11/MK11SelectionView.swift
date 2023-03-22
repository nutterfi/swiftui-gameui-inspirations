//
//  MK11SelectionView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 4/23/21.
//

import SwiftUI

extension Color {
  static var kombatYellow: Color {
    Color(red: 1, green: 254.0/255, blue: 144.0/255)
  }
  
  static var kombatBrown: Color {
    Color(red: 137.0/255, green: 104.0/255, blue: 64.0/255)
  }
}

struct MK11SelectionView: View {
    var body: some View {
      GeometryReader { proxy in
        let max = max(proxy.size.width, proxy.size.height)
        let min = min(proxy.size.width, proxy.size.height)
        
        ZStack {
          RadialGradient(gradient: Gradient(colors: [.kombatYellow, .kombatBrown]), center: .center, startRadius: max * 0.1, endRadius: max * 0.35)
                      
            HStack(spacing: 0) {
              MK11Left()
                .foregroundColor(.black)
              
              MK11Right()
                .foregroundColor(.black)
            }
            .frame(width: min * 0.9 / 1.75, height: min * 0.9)
        }
        .overlay(
          RadialGradient(gradient: Gradient(colors: [.clear, .black]), center: .center, startRadius: max * 0.1, endRadius: max * 0.6)
        )
        
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
      
    }
}

struct MK11SelectionView_Previews: PreviewProvider {
  static var previews: some View {
    MK11SelectionView()
      .frame(width: 512, height: 128)
      .previewLayout(.sizeThatFits)
  }
}
