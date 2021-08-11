//
//  OWUltimateMeter.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 7/10/21.
//

import SwiftUI

struct OWUltimateMeter: View {
  @Binding var progress: Float
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          
          StrokeStyledCircle(numberOfSegments: 38, segmentRatio: 0.8, lineWidthRatio: 0.11)
            .rotationEffect(Angle.degrees(-90))
            .frame(width: dim * 0.53, height: dim * 0.53)
            .foregroundColor(Color.gray)
          
          // Outer circle highlighted
          StrokeStyledCircle(numberOfSegments: 38, segmentRatio: 0.8, lineWidthRatio: 0.15, trim: [0, CGFloat(progress)])
            .rotationEffect(Angle.degrees(-90))
            .frame(width: dim * 0.51, height: dim * 0.51)
            .foregroundColor(Color.yellow)
          
          StrokeStyledCircle(numberOfSegments: 18, segmentRatio: 0.85, lineWidthRatio: 0.08)
            .rotationEffect(Angle.degrees(-90))
            
            .frame(width: dim * 0.35, height: dim * 0.35)
            .foregroundColor(Color.yellow)
          
          OWUltimateMeterBorder()
          
          Group {
            Text("\(Int(progress*100))")
              .font(.custom("AvenirNextCondensed-MediumItalic", size: dim / 6))
              .kerning(0)
            Text("%")
              .font(.custom("AvenirNextCondensed-Italic", size: dim / 18))
              .offset(x: dim / 9, y: dim / 25)
          }
          .foregroundColor(Color.white)
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct OWUltimateMeter_Previews: PreviewProvider {
    static var previews: some View {
      ZStack {
        Color.black.ignoresSafeArea()
        OWUltimateMeter(progress: .constant(0.25))
          .frame(width:400, height:400)
      }
      
    }
}
