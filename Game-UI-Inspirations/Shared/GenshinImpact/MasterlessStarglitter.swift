//
//  MasterlessStarglitter.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 10/21/21.
//

import SwiftUI
import Shapes

struct MasterlessStarglitter: View {
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          
          // disc
          Circle()
            .strokeBorder(Color("giStarglitterYellow"), lineWidth: dim * 0.15)
          
          Circle()
            .inset(by: dim * 0.05)
            .strokeBorder(Color("giStarglitterYellow-1"), lineWidth: dim * 0.05)
          
          let vertices = Quad().vertices(in: CGRect(x: 0, y: 0, width: dim, height: dim).insetBy(dx: dim * 0.185, dy: dim * 0.185))
          
          ForEach(0..<vertices.count, id:\.self) { index in
            let vertex = vertices[index]
            
            Circle()
              .frame(width: dim * 0.13, height: dim * 0.13)
              .foregroundColor(Color("giStarglitterYellow"))
              .overlay(
                Circle()
                  .frame(width: dim * 0.065, height: dim * 0.065)
                  .foregroundColor(Color("giNightSky"))
                  .overlay(
                    ConvexPolygon(sides: 6)
                      .rotation(.degrees(90))
                      .frame(width: dim * 0.035, height: dim * 0.035)
                      .foregroundColor(Color("giBlue-1"))
                    
                  )
              )
              .offset(x: -dim * 0.5 + vertex.x, y: -dim * 0.5 + vertex.y)
          }
          
          // backgrounded
          IsotoxalPolygon(sidePairs: 4, innerRadius: 0.5)
            .inset(by: dim * 0.1)
            .foregroundColor(Color("giStarglitterYellow"))
            .overlay(
              IsotoxalPolygon(sidePairs: 4, innerRadius: 0.5)
                .inset(by: dim * 0.1)
                .stroke(Color("giStarglitterYellow-1"))
            )
            .overlay(
              // TODO: Rounded corners
              IsotoxalPolygon(sidePairs: 4, innerRadius: 0.4)
                .inset(by: dim * 0.2)
                .foregroundColor(Color("giStarglitterYellow-1"))
            )
            .rotationEffect(.degrees(45))
          
          
          IsotoxalPolygon(sidePairs: 4, innerRadius: 0.5)
            .inset(by: dim * 0.05)
            .foregroundColor(Color("giLightBorder"))
            .overlay(
              IsotoxalPolygon(sidePairs: 4, innerRadius: 0.5)
                .inset(by: dim * 0.05)
                .stroke(Color("giNightSky"))
            )
          
          IsotoxalPolygon(sidePairs: 4, innerRadius: 0.5)
            .inset(by: dim * 0.1)
            .foregroundColor(Color("giNightSky"))
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct MasterlessStarglitter_Previews: PreviewProvider {
    static var previews: some View {
      MasterlessStarglitter()
      .frame(width: 256, height: 256)
      .background(Color.black.opacity(0.9))
        .previewLayout(.sizeThatFits)
    }
}
