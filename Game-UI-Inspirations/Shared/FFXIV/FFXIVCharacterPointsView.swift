//
//  FFXIVCharacterPointsView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 8/18/22.
//

import SwiftUI

struct FFXIVCharacterPointsView: View {
  @Binding var totalPoints: Int
  @Binding var actualPoints: Int
  var color: Color = .green
  var title: String
  
  var body: some View {
    VStack(spacing: 0) {
      HStack {
        Text(title)
        Spacer()
        Text("\(actualPoints)")
      }
      color
        .frame(height: 10)
      HStack {
        Spacer()
        Text("\(totalPoints)")
      }
    }
  }
}

struct FFXIVCharacterPointsView_Previews: PreviewProvider {
    static var previews: some View {
      FFXIVCharacterPointsView(
        totalPoints: .constant(178),
        actualPoints: .constant(54),
        title: "HP"
      )
        .frame(width: 256, height: 80)
        .previewLayout(.sizeThatFits)

    }
}
