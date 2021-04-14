//
//  MenuView.swift
//  MK11-KombatKard
//
//  Created by nutterfi on 3/18/21.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
      HStack(spacing: 30) {
        KombatKardView()
          .rotation3DEffect(
            .init(degrees: 20),
            axis: (x: 0.0, y: 1.0, z: 0.0))
            
        KombatKardView()
          .rotation3DEffect(
            .init(degrees: 10),
            axis: (x: 0.0, y: 1.0, z: 0.0))
        KombatKardView()
          .rotation3DEffect(
            .init(degrees: -10),
            axis: (x: 0.0, y: 1.0, z: 0.0))
        KombatKardView()
          .rotation3DEffect(
            .init(degrees: -20),
            axis: (x: 0.0, y: 1.0, z: 0.0))
      }
      .padding()
      
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
      MenuView()
        .previewDevice("iPad (8th generation)")
    }
}
