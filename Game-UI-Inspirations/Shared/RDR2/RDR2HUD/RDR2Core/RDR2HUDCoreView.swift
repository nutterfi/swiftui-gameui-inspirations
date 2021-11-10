//
//  RDR2HUDCoreView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 11/6/21.
//

import SwiftUI
import Shapes

struct RDR2HUDCoreView: View {
  var model: RDR2CoreModel
  
  func maskForType(_ type: RDR2CoreModel.CoreType) -> some View {
    Group {
      switch type {
      case .stamina:
        ZeusBoon()
          .scaleEffect(1.4)
      case .health:
        Heart()
      case .deadeye:
        DoubleTeardrop()
          .padding(5)
          .rotationEffect(.degrees(135))
      }
    }
  }
  
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        Circle().fill()
        
        MaskedProgressBar(progress: model.coreLevel,
                          backView: model.coreLevel == 0 ? Color.red : Color.gray,
                          frontView: Color.white,
                          mask: maskForType(model.type)
                              .rotationEffect(.degrees(90))
        )
          .frame(width: dim * 0.5, height: dim * 0.5)
          .rotationEffect(.degrees(-90))
        
        
        //
        Circle()
          .inset(by: dim * 0.05)
          .trim(from: 0, to: CGFloat(model.barLevel))
          .stroke(Color.white, lineWidth: dim * 0.1)
          .rotationEffect(.degrees(-90))
          
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

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
      .frame(width: 256, height: 256)
    }
}
