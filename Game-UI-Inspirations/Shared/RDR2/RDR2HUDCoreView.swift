//
//  RDR2HUDCoreView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 11/6/21.
//

import SwiftUI
import Shapes

struct RDR2CoreModel {
  
  enum CoreType {
    case health
    case stamina
    case deadeye
  }

  var coreLevel: Float
  var barLevel: Float
  var type: CoreType
}

class RDR2HUDCoreViewModel: ObservableObject {
  @Published private(set) var healthCore: RDR2CoreModel
  @Published private(set) var staminaCore: RDR2CoreModel
  @Published private(set) var deadeyeCore: RDR2CoreModel
  
  init() {
    healthCore = RDR2CoreModel(coreLevel: 0.5, barLevel: 0.25, type: .health)
    staminaCore = RDR2CoreModel(coreLevel: 0.2, barLevel: 0.1, type: .stamina)
    deadeyeCore = RDR2CoreModel(coreLevel: 0.8, barLevel: 0.75, type: .deadeye)
  }
  
}

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
          .padding()
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
                          backView: Color.gray,
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
          Color.rdr2Minimap
          RDR2HUDCoreView(model: viewModel.healthCore)
            .frame(width: dim * 0.2, height: dim * 0.2)
            .offset(x: -dim * 0.25, y: -dim * 0.25)
          RDR2HUDCoreView(model: viewModel.staminaCore)
            .frame(width: dim * 0.2, height: dim * 0.2)
            .offset(x: -dim * 0.0, y: -dim * 0.35)
          RDR2HUDCoreView(model: viewModel.deadeyeCore)
            .overlay((Text("x").scaleEffect(4.4).foregroundColor(.black)))
            .frame(width: dim * 0.2, height: dim * 0.2)
            .offset(x: dim * 0.25, y: -dim * 0.45)
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
     
    }
}

struct RDR2HUDCoreMenu_Previews: PreviewProvider {
    static var previews: some View {
      RDR2HUDCoreMenu()
    }
}
