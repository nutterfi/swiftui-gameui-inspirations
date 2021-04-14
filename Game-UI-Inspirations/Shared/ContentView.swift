//
//  ContentView.swift
//  Shared
//
//  Created by nutterfi on 4/13/21.
//

import SwiftUI
import Shapes

struct ContentView: View {
  @State private var scale: CGFloat = 1
  @State private var opacity: Double = 1
  
  var body: some View {
    HStack {
      Pulsar(duration: 0.5)
      Pulsar(duration: 1.0)
      Pulsar(duration: 10)
    }
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
