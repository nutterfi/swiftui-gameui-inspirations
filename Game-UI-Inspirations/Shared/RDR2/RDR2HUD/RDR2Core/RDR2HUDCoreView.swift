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
        UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 100, bottomTrailing: 100))
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
        
        MaskedProgressBar(
          progress: model.coreLevel,
          backView: model.coreLevel == 0 ? Color.red : Color.gray,
          frontView: Color.white,
          mask: maskForType(model.type)
            .rotationEffect(.degrees(90))
        )
          .frame(width: dim * 0.5, height: dim * 0.5)
          .rotationEffect(.degrees(-90))
        
        // progress bar
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

struct RDR2HUDCoreView_Previews: PreviewProvider {
  static var previews: some View {
    RDR2HUDCoreView(model: RDR2CoreModel(coreLevel: 0.28, barLevel: 0.1, type: .stamina))
      .previewLayout(.sizeThatFits)
      .frame(width: 256, height: 256)
      .background(Color.gray)
  }
}
