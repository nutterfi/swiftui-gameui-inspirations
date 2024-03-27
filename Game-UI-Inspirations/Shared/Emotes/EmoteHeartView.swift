//
//  EmoteView.swift
//  Game-UI-Inspirations (iOS)
//
//  Created by nutterfi on 11/2/21.
//

import SwiftUI

struct EmoteHeartView: View {
    var body: some View {
      ZStack {
        Color.black
        AphroditeBoon()
          .foregroundColor(Color.white)
        LinearGradient(gradient: Gradient(colors: [.white, .hadesAphroditeMagenta, .hadesAphroditePink]), startPoint: .topLeading, endPoint: .bottomTrailing)
          .mask(
            AphroditeBoon()
          )
        
        AphroditeBoon()
          .inset(by: 10)
          .offset(x: 0, y: 1)
          .foregroundColor(Color.hadesAphroditePink)
        
      }
      .frame(width: 512, height: 512)
    }
}

struct EmoteView_Previews: PreviewProvider {
    static var previews: some View {
      EmoteHeartView()
        .previewLayout(.sizeThatFits)
    }
}
