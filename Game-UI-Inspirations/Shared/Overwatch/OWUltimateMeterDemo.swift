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
            .frame(width: 100, height: 100)
          OWUltimateMeter(progress: $progress)
            .frame(width: 200, height: 200)
          OWUltimateMeter(progress: $progress)
            .frame(width: 300, height: 300)
        }
        .padding()
      }
    }
}

struct OWUltimateMeterDemo_Previews: PreviewProvider {
    static var previews: some View {
      OWUltimateMeterDemo()
        .previewDevice("iPhone 12 Pro Max")
    }
}
