//
//  OWUltimateMeter.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 7/10/21.
//

import SwiftUI

class OWUltimateViewModel: ObservableObject {
  @Published private(set) var progress: Float = 0 // 0 - 100
}

struct OWUltimateMeter: View {
  @Binding var progress: Float
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          
          Circle()
            .rotation(.degrees(-90))
            .stroke(style: StrokeStyle.init(lineWidth: 25, lineCap: .butt, lineJoin: .bevel, miterLimit: 0, dash: [12, 3], dashPhase: 0))
            .frame(width: dim * 0.55, height: dim * 0.55)
            .foregroundColor(Color.gray)
          
          // Outer circle highlighted
          Circle()
            .trim(from: 0, to: CGFloat(progress))
            .rotation(.degrees(-90))
            .stroke(style: StrokeStyle.init(lineWidth: 30, lineCap: .butt, lineJoin: .bevel, miterLimit: 2, dash: [12, 3], dashPhase: 0))
            .frame(width: dim * 0.55, height: dim * 0.55)
            .foregroundColor(Color.yellow)
          
          Circle()
            .rotation(.degrees(-90))
            .stroke(style: StrokeStyle.init(lineWidth: 10, lineCap: .butt, lineJoin: .bevel, miterLimit: 2, dash: [23, 3], dashPhase: 0))
            .frame(width: dim * 0.35, height: dim * 0.35)
            .foregroundColor(Color.yellow)
          
          Circle()
            .trim(from: 0, to: 0.94)
            .rotation(.init(degrees: 101))
            .stroke(Color.gray, lineWidth: 2)
            .frame(width: dim * 0.8, height: dim * 0.8)
          Circle()
            .stroke(Color.gray, lineWidth: 2)
            .frame(width: dim * 0.15, height: dim * 0.15)
            .offset(x: 0, y: dim * 0.4)
          Text("Q")
            .font(.largeTitle)
            .foregroundColor(Color.gray)
            .offset(x: 0, y: dim * 0.4)
          HStack(alignment: .bottom, spacing: 0) {
//            let pString = String(format: "%d", progress)
            Text("\(Int(progress*100))")
              .font(.custom("AvenirNextCondensed-Italic", size: 80))
            Text("%")
              .font(.custom("AvenirNextCondensed-Italic", size: 40))
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
      }
      
    }
}
