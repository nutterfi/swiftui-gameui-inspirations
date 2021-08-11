//
//  SWTORLogo.swift
//  SWTORLogo
//
//  Created by nutterfi on 8/3/21.
//

import SwiftUI

struct SWTORLogo: View {
  var color: Color = .black
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          Circle()
            .stroke(color, lineWidth: dim / 20)
            .frame(width: dim * 0.9, height: dim * 0.9)
                    
          SWTOREmpireLogo(color: color)
            .frame(width: dim * 0.8, height: dim * 0.8)
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct SWTORLogo_Previews: PreviewProvider {
    static var previews: some View {
      SWTORLogo(color: Color.red)
    }
}
