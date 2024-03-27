//
//  EmoteReuleauxView.swift
//  Game-UI-Inspirations (iOS)
//
//  Created by nutterfi on 11/2/21.
//

import SwiftUI
import Shapes

struct EmoteReuleauxView: View {
    var body: some View {
      ZStack {
        Reuleaux.triangle
          .fill(
            RadialGradient(colors: [.purple, .red], center: .center, startRadius: 10, endRadius: 400)
        
          )
          .overlay(
            Reuleaux.triangle
              .stroke(lineWidth: 32)
          )
          .padding()
      }
      .padding()
      
    }
}

struct EmoteReuleauxView_Previews: PreviewProvider {
    static var previews: some View {
      EmoteReuleauxView()
        .previewLayout(.sizeThatFits)
      .frame(width: 512, height: 512)
    }
}
