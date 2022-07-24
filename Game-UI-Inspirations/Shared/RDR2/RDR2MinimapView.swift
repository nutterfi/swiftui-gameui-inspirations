//
//  RDR2MinimapView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 3/13/21.
//

import SwiftUI
import Shapes

struct RDR2MinimapView: View {
  @StateObject private var viewModel = RDR2MinimapViewModel.demo
  
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        let systemSize: CGFloat = max(dim / 20, 12.0)
        
        ZStack {
          Circle()
            .fill(Color("rdr2Minimap", bundle: nil))
            .frame(width: dim, height: dim)
          // Compass Markers
            .overlay(
              
              ZStack {
                ElevationMap()
                  .opacity(0.3)
                  .frame(width: dim, height: dim)
                  .offset(x: 0.25 * dim, y: 0.17 * dim)
                  .mask(Circle())
                
                Text("E")
                  .font(.system(size: systemSize))
                  .offset(x: dim / 2 - 15, y: 0)
                
                Text("W")
                  .font(.system(size: systemSize))
                  .offset(x: -dim / 2 + 15, y: 0)
                
                Text("N")
                  .font(.system(size: systemSize))
                  .offset(x: 0, y: -dim / 2 + 20)
                Text("S")
                  .font(.system(size: systemSize))
                  .offset(x: 0, y: dim / 2 - 15)
                
                // TICK MARKS
                let numberOfMarks: Int = 8
                ForEach(0..<numberOfMarks) { index in
                  let rotation = Angle(radians: 2 * .pi / Double(numberOfMarks) * Double(index))
                  Rectangle()
                    .frame(width: 1, height: 10)
                    .shadow(color: .white, radius: 5, x: 0, y: 0)
                    .offset(x: 0, y: -dim / 2 - 3)
                    .rotationEffect(rotation)
                }
                
                // FIXME: Placeholder
                // Draw your own stuff!
                Image(systemName: "arrow.up")
                  .resizable()
                  .scaledToFill()
                  .frame(width: dim / 20, height: dim / 15)
                  .offset(x: 0, y: -dim / 2 - 3)
                
                ForEach(0..<viewModel.entities.count) { index in
                  let entity = viewModel.entities[index]
                  IsotoxalPolygon(sides: 8, innerRadius: 0.5)
                    .fill(Color.red)
                    .frame(width:20, height: 20)
                    .offset(x: entity.position.x, y: entity.position.y)
                  
                }
                
              }
            )
            .overlay(
              // TODO: Opaque if riding a horse
              Teardrop()
                .stroke(Color.kombatBrown, lineWidth: 2)
                .frame(width:10, height: 20)
            )
          
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
     
    }
}

struct MinimapView_Previews: PreviewProvider {
    static var previews: some View {
      ZStack {
        Color.gray
        RDR2MinimapView()
          .padding()
      }
    }
}
