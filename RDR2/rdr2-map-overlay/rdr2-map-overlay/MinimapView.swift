//
//  MinimapView.swift
//  rdr2-map-overlay
//
//  Created by nutterfi on 3/13/21.
//

import SwiftUI

/**
 TODO:
 1. make a shadow on each of the directional tick marks - DONE
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
            .fill(Color.rdr2map)
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
                
                ForEach(0..<viewModel.npcs.count) { index in
                  let npc = viewModel.npcs[index]
                  Circle()
                    .fill(Color.red)
                    .frame(width:10, height: 10)
                    .offset(x: npc.position.x, y: npc.position.y)
                  
                }
                
              }
            )
            .overlay(
              // FIXME: Teardrop shape
              Circle()
                .stroke(Color.black, lineWidth: 2)
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
