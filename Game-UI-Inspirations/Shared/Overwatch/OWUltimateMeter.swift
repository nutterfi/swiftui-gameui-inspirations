//
//  OWUltimateMeter.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 7/10/21.
//

import SwiftUI
import Shapes

struct OWUltimateMeter: View {
  @Binding var progress: Float
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          StrokeStyledCircle(numberOfSegments: 38, dashPattern: [4, 1], lineWidthRatio: 0.1)
            .rotationEffect(Angle.degrees(-90))
            .frame(width: dim * 0.6, height: dim * 0.6)
            .foregroundColor(Color.gray)
          
          // Outer circle highlighted
          StrokeStyledCircle(numberOfSegments: 38, dashPattern: [4, 1], lineWidthRatio: 0.14, trim: (0, CGFloat(progress)))
            .rotationEffect(Angle.degrees(-90))
            .frame(width: dim * 0.6, height: dim * 0.6)
            .foregroundColor(Color.yellow)
          
          StrokeStyledCircle(numberOfSegments: 18, dashPattern: [0.85, 0.15], lineWidthRatio: 0.08)
            .rotationEffect(Angle.degrees(-90))
            
            .frame(width: dim * 0.36, height: dim * 0.36)
            .foregroundColor(Color.yellow)
          
          OWUltimateMeterBorder()
          
          Group {
            Text("\(Int(progress*100))")
              .font(.custom("AvenirNextCondensed-MediumItalic", size: dim / 6))
              .kerning(0)
              .frame(maxWidth: .infinity)
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
