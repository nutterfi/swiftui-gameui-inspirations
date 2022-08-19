//
//  FFXIVWindowHeaderView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 8/18/22.
//

import SwiftUI

struct FFXIVWindowHeaderView: View {
  @Binding var title: String
  @Binding var description: String
  
  var body: some View {
    HStack {
      Text(title)
        .foregroundColor(.white)
      
      Spacer()
      
      Text(description)
        .foregroundColor(.hadesZeusYellow)
      
      Button {
        print("TODO: Hide window")
      } label: {
        Image(systemName: "x.circle")
          .foregroundColor(.hadesZeusYellow)
      }

    }
    .padding(1)
    .background(Color(red: 66/255, green: 66/255, blue: 66/255))
    .frame(maxWidth: .infinity)
  }
}

struct FFXIVWindowHeaderView_Previews: PreviewProvider {
    static var previews: some View {
      FFXIVWindowHeaderView(
        title: .constant("Character"),
        description: .constant("Reu Leuax".uppercased())
      )
        .frame(width: 300)
        .previewLayout(.sizeThatFits)
    }
}
