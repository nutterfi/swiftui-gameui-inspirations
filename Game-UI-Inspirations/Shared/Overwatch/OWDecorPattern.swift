//
//  OWDecorPattern.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 2/1/22.
//

import SwiftUI
import Shapes

struct OWDecorPattern: View {
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        let numHexes = 8
        
        ZStack {
          Color.gray.ignoresSafeArea()
          Circle()
            .fill(Color.purple)

          IsotoxalPolygon(sides: 16, innerRadius: 0.77)
            .inset(by: dim * 0.25)
            .stroke(lineWidth: dim * 0.01)
            .foregroundColor(.hadesZeusYellow)
          
          IsotoxalPolygon(sides: 16, innerRadius: 0.77)
            .inset(by: dim * 0.38)
            .foregroundColor(.hadesZeusYellow)
          
          IsotoxalPolygon(sides: 16, innerRadius: 0.77)
            .inset(by: dim * 0.4)
            .stroke(lineWidth: 1)
            
          ForEach(0..<numHexes) { index in
            let angle = Angle(radians: 2 * .pi / CGFloat(numHexes) * CGFloat(index))
            ConvexPolygon(sides: 6)
              .stroke(lineWidth: dim * 0.01)
              .rotationEffect(angle + .radians(.pi / 2))
              .angularOffset(magnitude: dim * 0.27, angle: angle)
              .frame(width: dim * 0.2, height: dim * 0.2)
              .foregroundColor(.hadesZeusYellow)
          }
          
          Circle()
            .strokeBorder(Color.kombatBrown, lineWidth: dim * 0.1)
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct OWDecorPattern_Previews: PreviewProvider {
    static var previews: some View {
        OWDecorPattern()
    }
}
