//
//  MasterlessStardust.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 10/21/21.
//

import SwiftUI
import Shapes

struct MasterlessStardust: View {
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          ConvexPolygon(sides: 4)
            .inset(by: dim * 0.05)
            .strokeBorder(Color("giLightBorder"), lineWidth: dim * 0.12)
          
          ConvexPolygon(sides: 4)
            .inset(by: dim * 0.08)
            .strokeBorder(Color("giLightPurple"), lineWidth: dim * 0.06)
          
          let vertices = Quad().vertices(in: CGRect(x: 0, y: 0, width: dim, height: dim).insetBy(dx: dim * 0.25, dy: dim * 0.25))
          
          ForEach(0..<vertices.count, id:\.self) { index in
            let vertex = vertices[index]
            
            Kite(pointRatio: 0.3)
              .frame(width: dim * 0.15, height: dim * 0.22)
              .overlay(
                Kite(pointRatio: 0.3)
                  .frame(width: dim * 0.05, height: dim * 0.08)
                  .offset(x: 0, y: -dim * 0.02)
                  .foregroundColor(Color("giPurple"))
              )
              .background(
                Kite(pointRatio: 0.3)
                  .frame(width: dim * 0.16, height: dim * 0.24)
                  .foregroundColor(Color.black)
              )
              .rotationEffect(.degrees(135 + Double(index) * 90))
              .offset(x: -dim * 0.5 + vertex.x, y: -dim * 0.5 + vertex.y)
              .foregroundColor(Color("giLightBorder"))
          }
          
          IsotoxalPolygon(sidePairs: 4, innerRadius: 0.5)
            .inset(by: dim * 0.15)
            .foregroundColor(Color("giLightBorder"))
            .overlay(
              IsotoxalPolygon(sidePairs: 4, innerRadius: 0.5)
                .inset(by: dim * 0.15)
                .stroke(Color.black)
            )
          
          IsotoxalPolygon(sidePairs: 4, innerRadius: 0.5)
            .inset(by: dim * 0.2)
            .foregroundColor(Color("giNightSky"))
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct MasterlessStardust_Previews: PreviewProvider {
    static var previews: some View {
      MasterlessStardust()
        .previewLayout(.sizeThatFits)
      .frame(width: 256, height: 256)
      .background(Color.black.opacity(0.9))
    }
}
