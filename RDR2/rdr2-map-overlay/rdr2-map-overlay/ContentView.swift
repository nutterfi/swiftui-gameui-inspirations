//
//  ContentView.swift
//  rdr2-map-overlay
//
//  Created by nutterfi on 3/13/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MinimapView()
          .frame(width: 100, height: 100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
