//
//  RibbonBanner.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/27/21.
//

import SwiftUI

struct RibbonBanner: View {
  var primary: Color = .purple
  var secondary: Color = .pink
  var lineWidth: CGFloat = 1
  var stroke: Color = .black
  
    var body: some View {
      ZStack {
        RibbonButt()
          .fill(primary)
          .overlay(RibbonButt().stroke(stroke, lineWidth: lineWidth))
        RibbonBack()
          .fill(secondary)
          .overlay(RibbonBack().stroke(stroke, lineWidth: lineWidth))
        RibbonButt()
          .scale(x: -1)
          .fill(primary)
          .overlay(RibbonButt().scale(x: -1).stroke(stroke, lineWidth: lineWidth))
        RibbonBack()
          .scale(x: -1)
          .fill(secondary)
          .overlay(RibbonBack().scale(x: -1).stroke(stroke, lineWidth: lineWidth))
        RibbonBelly()
          .fill(primary)
          .overlay(RibbonBelly().stroke(stroke, lineWidth: lineWidth))
      }
    }
}

struct RibbonBanner_Previews: PreviewProvider {
    static var previews: some View {
      RibbonBanner(primary: .purple, secondary: .pink, lineWidth: 12)
        .padding()
    }
}
