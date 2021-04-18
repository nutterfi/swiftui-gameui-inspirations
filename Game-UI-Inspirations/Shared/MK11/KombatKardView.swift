//
//  KombatKardView.swift
//
//  Created by nutterfi on 3/18/21.
//

import SwiftUI
import Shapes

struct KombatKardView: View {
    var body: some View {
      ZStack {
        InvertedCornerRectangle(cornerRadius: 20)
          .stroke(Color.purple, lineWidth: 10)
          .frame(width: 200, height: 300)
        Image(systemName: "person.2.circle")
          .resizable()
          .scaledToFill()
          .frame(width: 200, height: 40)
      }
    }
}

struct KombatKardView_Previews: PreviewProvider {
    static var previews: some View {
        KombatKardView()
    }
}
