//
//  ContentView.swift
//  mk11-countdown-timer
//
//  Created by nutterfi on 3/11/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      VStack {
        CountdownTimerView()
          .frame(width: 100)
        CountdownTimerView()
          .frame(width: 200)
        CountdownTimerView()
          .frame(width: 50)
        CountdownTimerView()
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
