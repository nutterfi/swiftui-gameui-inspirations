//
//  MGSVMissionTextDemo.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 7/13/21.
//

import SwiftUI

struct MGSVMissionTextDemo: View {
    var body: some View {
      GeometryReader { proxy in
        ZStack {
          Color.black.ignoresSafeArea()
          VStack {
            let text = "Mission Complete - Did the Thing. +10000000 GMP"
            TypewriterTextView(foreground: LinearGradient(colors: [.gray, .tlouYellow], startPoint: .leading, endPoint: .trailing), input: text)
          }
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct MGSVMissionTextDemo_Previews: PreviewProvider {
    static var previews: some View {
        MGSVMissionTextDemo()
    }
}
