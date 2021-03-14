//
//  MinimapView.swift
//  rdr2-map-overlay
//
//  Created by nutterfi on 3/13/21.
//

import SwiftUI

struct MinimapView: View {
  @StateObject private var viewModel = MinimapViewModel()
    var body: some View {
      GeometryReader { proxy in
        let width = proxy.size.width
        let height = proxy.size.height
        let dim = min(width, height)
        
        ZStack {
          Circle()
            .stroke()
            .frame(width: dim, height: dim)
          // Compass Markers
            .overlay(
              ZStack {
                Text("E")
                  .font(.system(size: dim / 20))
                  .offset(x: dim / 2 - 10, y: 0)
                
                Text("W")
                  .font(.system(size: dim / 20))
                  .offset(x: -dim / 2 + 10, y: 0)
                
                Text("N")
                  .font(.system(size: dim / 20))
                  .offset(x: 0, y: -dim / 2 + 10)
                Text("S")
                  .font(.system(size: dim / 20))
                  .offset(x: 0, y: dim / 2 - 10)
                
                let numberOfMarks: Int = 8
                ForEach(0..<numberOfMarks) { index in
                  let rotation = Angle(radians: 2 * .pi / Double(numberOfMarks) * Double(index))
                  Color.black
                    .frame(width:2, height: 15)
                    .offset(x: 0, y: -dim / 2)
                    .rotationEffect(rotation)
                }
                
              }
            )
          
          
        }
        .frame(width: width, height: height)
      }
     
    }
}

struct MinimapView_Previews: PreviewProvider {
    static var previews: some View {
      MinimapView()
          .padding()
    }
}
