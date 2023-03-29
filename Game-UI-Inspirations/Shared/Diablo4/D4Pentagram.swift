//
//  D4Pentagram.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 3/25/23.
//

import SwiftUI
import Shapes

struct D4Pentagram: View {
    var body: some View {
      ZStack {
        Circle()
          .stroke(lineWidth: 5)
        StarPolygon(points: 5, density: 2)
          .stroke(lineWidth: 5)
      }
      .foregroundColor(.red)
      .padding()
    }
}

struct D4Pentagram_Previews: PreviewProvider {
    static var previews: some View {
        D4Pentagram()
    }
}
