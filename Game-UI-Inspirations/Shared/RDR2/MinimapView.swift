//
//  MinimapView.swift
//  rdr2-map-overlay
//
//  Created by nutterfi on 3/13/21.
//

import SwiftUI

/**
 TODO:
 2. Make a map texture (Color for now)
 3. Add POI and NPC
 4. Oval-ish background
 */

struct MinimapView: View {
  @StateObject private var viewModel = MinimapViewModel.demo
  
    var body: some View {
      GeometryReader { proxy in
        let width = proxy.size.width
        let height = proxy.size.height
        let dim = min(width, height)
        let systemSize: CGFloat = max(dim / 20, 12.0)
        
        ZStack {
          Circle()
            .fill(Color("rdr2Minimap", bundle: nil))
            .frame(width: dim, height: dim)
          // Compass Markers
            .overlay(
              
              ZStack {
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
                    .frame(width: 3, height: 15)
                    .shadow(color: .white, radius: 5, x: 0, y: 0)
                    .offset(x: 0, y: -dim / 2 - 3)
                    .rotationEffect(rotation)
                }
                
                // FIXME: Placeholder
                // Draw your own stuff!
                Image(systemName: "arrow.up")
                  .resizable()
                  .scaledToFill()
                  .frame(width: dim / 10, height: dim / 10)
                  .offset(x: 0, y: -dim / 2 - 8)
                
                ForEach(0..<viewModel.entities.count) { index in
                  let entity = viewModel.entities[index]
                  Circle()
                    .fill(Color.red)
                    .frame(width:10, height: 10)
                    .offset(x: entity.position.x, y: entity.position.y)
                  
                }
                
              }
            )
            .overlay(
              // FIXME: Teardrop shape
              // TODO: Opaque if riding a horse
              Circle()
                .stroke(Color.kombatBrown, lineWidth: 2)
                .frame(width:10, height: 10)
            )
          
        }
        .frame(width: width, height: height)
      }
     
    }
}

struct MinimapView_Previews: PreviewProvider {
    static var previews: some View {
      ZStack {
        Color.gray
        MinimapView()
          .padding()
      }
    }
}
