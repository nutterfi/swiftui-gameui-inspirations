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
        let dim = max(proxy.size.width, proxy.size.height)
        ZStack {
          RadialGradient(gradient: Gradient(colors: [.kombatYellow, .kombatBrown]), center: .center, startRadius: dim * 0.1, endRadius: dim * 0.35)
          HStack {
            Text("Mortal".uppercased())
              .font(.headline)
            MK11Left()
              .foregroundColor(.black)
              .frame(width: dim * 0.1, height: dim * 0.125 / 60 * 200)
            
            MK11Right()
              .foregroundColor(.black)
              .frame(width: dim * 0.1, height: dim * 0.125 / 60 * 200)
            
            Text("Kombat".uppercased())
              .font(.headline)
          }
        }
        .overlay(
          RadialGradient(gradient: Gradient(colors: [.clear, .black]), center: .center, startRadius: dim * 0.1, endRadius: dim * 0.6)
        )
        
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
      
    }
}

struct MK11SelectionView_Previews: PreviewProvider {
    static var previews: some View {
        MK11SelectionView()
    }
}
