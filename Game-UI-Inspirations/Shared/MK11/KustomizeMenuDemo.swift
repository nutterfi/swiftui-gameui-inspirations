//
//  ContentView.swift
//  KustomizeMenu
//
//  Created by nutterfi on 4/1/21.
//

import SwiftUI

extension Color {
  static var mk11Gold: Color {
    Color(red: 39.0/255, green: 37.0/255, blue: 11.0/255)
  }
}

struct KustomizeMenuDemo: View {
    var body: some View {
      ZStack {
        Color.red.ignoresSafeArea()
        
        Capsule()
            .glitterBorder(numberOfElements: 100, color: .mk11Gold, useGravity: false)
          .frame(width: 200, height: 100)
      }
          
    }
}

struct KustomizeMenuDemo_Previews: PreviewProvider {
    static var previews: some View {
      KustomizeMenuDemo()
    }
}
