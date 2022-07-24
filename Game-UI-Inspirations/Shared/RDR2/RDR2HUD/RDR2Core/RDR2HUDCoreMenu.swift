//
//  RDR2HUDCoreMenu.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 7/23/22.
//

import SwiftUI

struct RDR2HUDCoreMenu: View {
  @StateObject private var viewModel = RDR2HUDCoreViewModel()
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        Group {
          RDR2HUDCoreView(model: viewModel.deadeyeCore)
            .angularOffset(magnitude: dim * 0.4, angle: .degrees(270))
          
          RDR2HUDCoreView(model: viewModel.healthCore)
            .angularOffset(magnitude: dim * 0.41, angle: .degrees(248))
          
          RDR2HUDCoreView(model: viewModel.staminaCore)
            .angularOffset(magnitude: dim * 0.44, angle: .degrees(226))
        }
        .frame(width: dim * 0.13, height: dim * 0.2)
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
    
  }
}

struct RDR2HUDCoreMenu_Previews: PreviewProvider {
  static var previews: some View {
    RDR2HUDCoreMenu()
      .previewLayout(.sizeThatFits)
      .frame(width: 512, height: 512)
  }
}
