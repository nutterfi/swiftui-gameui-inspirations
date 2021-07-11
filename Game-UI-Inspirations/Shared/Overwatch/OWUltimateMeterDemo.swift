//
//  OWUltimateMeterDemo.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 7/10/21.
//

import SwiftUI

struct OWUltimateMeterDemo: View {
  @State private var progress: Float = 0
    var body: some View {
      ZStack {
        Color.black.ignoresSafeArea()
        VStack {
          Slider(value:$progress)
          OWUltimateMeter(progress: $progress)
        }
        .padding()
      }
    }
}

struct OWUltimateMeterDemo_Previews: PreviewProvider {
    static var previews: some View {
        OWUltimateMeterDemo()
    }
}
