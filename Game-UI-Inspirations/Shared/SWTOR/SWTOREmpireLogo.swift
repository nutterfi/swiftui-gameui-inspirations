//
//  SWTOREmpireLogo.swift
//  SWTOREmpireLogo
//
//  Created by nutterfi on 8/10/21.
//

import SwiftUI

struct SWTOREmpireLogo: View {
  var color: Color = .black
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          StrokeStyledPolygon(sides: 6, dashes: 6, dashFillRatio: 0.7, lineWidthRatio: dim * 0.8 * 0.0001, dashPhaseRatio: 0.36, lineCap: .square)
            .foregroundColor(color)
            .frame(width: dim, height: dim)
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct SWTOREmpireLogo_Previews: PreviewProvider {
    static var previews: some View {
        SWTOREmpireLogo()
        .padding()
    }
}
