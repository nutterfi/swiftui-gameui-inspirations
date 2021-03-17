//
//  ContentView.swift
//  Control-Loading-Animations
//
//  Created by nutterfi on 3/10/21.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    ZStack {
      Color.primary
        .ignoresSafeArea()
      LoadingRingsView(color: .white, lineWidth: 8)
        .frame(width: 100, height: 100)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
