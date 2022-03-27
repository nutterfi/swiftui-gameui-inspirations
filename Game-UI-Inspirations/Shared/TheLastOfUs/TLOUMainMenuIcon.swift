//
//  TLOUMainMenuIcon.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 10/28/21.
//

import SwiftUI

struct TLOUMainMenuIcon: View {
    var body: some View {
      ZStack {
        Color.black.ignoresSafeArea()
        VStack(alignment: .leading, spacing: -18) {
          Group {
            Text("THE")
            Text("LAST")
            Text("OF US")
          }
          .font(.custom("AvenirNextCondensed-Medium", size: 32))
        }
        .foregroundColor(.white)
        .background(Color.black.frame(maxWidth: .infinity))
        
        LinearGradient(colors: [.black.opacity(0.9), .clear], startPoint: .bottomLeading, endPoint: .topTrailing)
      }
    }
}

struct TLOUMainMenuIcon_Previews: PreviewProvider {
    static var previews: some View {
      TLOUMainMenuIcon()
        .frame(width: 256, height: 128)
        .previewLayout(.sizeThatFits)
    }
}
