//
//  FFXIVCharacterTabView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 8/18/22.
//

import SwiftUI
import Shapes

struct FFXIVCharacterTabView: View {
  @Binding var title: String
  @Binding var selected: Bool
    
  var body: some View {
    ZStack(alignment: .bottomLeading) {
      VStack(spacing: 0) {
        Color.black.opacity(0.5)
        Color.black.opacity(0.8)
      }
      .overlay(
        Text(title)
          .foregroundColor(.white)
      )
      .clipShape(
        CutCornerRectangle(
          corners: [
            .topLeft : 18,
            .bottomLeft : 12,
            .topRight : 10,
            .bottomRight : 20
          ]
        )
      )
//      .frame(maxWidth: .infinity)
    
      Rectangle()
        .frame(width: 14, height: 5)
        .rotationEffect(.degrees(45))
        .offset(x: 5, y: -5)
        .foregroundColor(selected ? .hadesZeusYellow : .gray)
        
    }
  }
}

struct FFXIVCharacterTabView_Previews: PreviewProvider {
    static var previews: some View {
//      FFXIVCharacterTabView(
//        title: .constant("Attributes"),
//        selected: .constant(true)
//      )
//      .frame(width: 150, height: 30)
      HStack {
        FFXIVCharacterTabView(title: .constant("Attributes"), selected: .constant(true))
        
        FFXIVCharacterTabView(title: .constant("Profile"), selected: .constant(false))
        
        FFXIVCharacterTabView(title: .constant("Classes/Jobs"), selected: .constant(false))
      }
      .frame(width: 360, height: 30)
      .previewLayout(.sizeThatFits)

    }
}
