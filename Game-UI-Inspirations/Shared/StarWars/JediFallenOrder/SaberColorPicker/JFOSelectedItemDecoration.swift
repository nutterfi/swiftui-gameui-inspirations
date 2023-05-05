//
//  JFOSelectedItemDecoration.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/4/23.
//

import SwiftUI
import Shapes

// TODO: remove inset and reorganize the layout of the item+overlay
struct JFOSelectedItemDecoration: View {
  var body: some View {
    ZStack {
      StrokeStyledCircle(numberOfSegments: 1, dashPattern: [10, 1, 4, 1, 7, 1, 1], lineWidth: 2)
        .inset(by: -10)
        .foregroundColor(.jfoCopper)
        .shadow(color: .white, radius: 1)
    }
  }
}

struct JFOSelectedItemDecoration_Previews: PreviewProvider {
    static var previews: some View {
        JFOSelectedItemDecoration()
          .padding(20)
    }
}
