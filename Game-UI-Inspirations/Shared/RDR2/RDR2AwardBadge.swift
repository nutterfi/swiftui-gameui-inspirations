//
//  RDR2AwardBadge.swift
//  RDR2AwardBadge
//
//  Created by nutterfi on 8/5/21.
//

import SwiftUI
import Shapes

struct RDR2AwardBadge: View {
  var image: String
  var foreground: Color = .white
  var background: Color = .black
  
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        Polygon(sides: 6)
          .stroke(foreground, lineWidth: 3)
          .frame(width: dim * 0.5, height: dim * 0.5)
          .background(background.mask(Polygon(sides: 6)))
          .rotationEffect(.degrees(90))
        
        Image(systemName: image)
          .resizable()
          .scaledToFit()
          .frame(width: dim * 0.25, height: dim * 0.25)
          .foregroundColor(foreground)
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct RDR2AwardBadge_Previews: PreviewProvider {
    static var previews: some View {
      RDR2AwardBadge(image: "lasso")
    }
}