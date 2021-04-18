//
//  ControlQuestMarker.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 4/17/21.
//

import SwiftUI
// TODO: Don't draw outside the frame
struct ControlQuestMarker: View {
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          Rectangle()
            .stroke(Color.controlYellow, lineWidth: 2)
            .frame(width: dim, height: dim)
          Color.controlYellow
            .frame(width: dim / 2, height: dim / 2)
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
      .rotationEffect(.init(degrees: 45))
    }
}

struct ControlQuestMarker_Previews: PreviewProvider {
    static var previews: some View {
      
        
        ControlQuestMarker()
          .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
          .background(Color.black)
      
    }
}
