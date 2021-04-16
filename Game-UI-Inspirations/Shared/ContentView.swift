//
//  ContentView.swift
//  Shared
//
//  Created by nutterfi on 4/13/21.
//

import SwiftUI
import Shapes

class ContentViewModel: ObservableObject {
  @Published private(set) var titles: [String]
  init() {
    titles = ["Control", "MK11", "Genshin Impact", "RDR2"]
  }
}

/*
 TODO:
 
Each item in this list to have its own unique flair for the game that we are about to peruse
 
 **/

struct ContentView: View {
  @StateObject private var viewModel = ContentViewModel()
  
  func destination(index: Int) -> some View {
    MinimapDemo()
  }
  
  var body: some View {
    NavigationView {
      ZStack {
        List(viewModel.titles, id: \.self) { data in
          NavigationLink(destination: destination(index: 0)) {
            Text(data)
              .font(.largeTitle)
              .frame(maxWidth: .infinity)
              .foregroundColor(.white)
              .background(Color.blue)
          }
        }
        .background(Color.purple)
      }
      .navigationTitle("Games")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
