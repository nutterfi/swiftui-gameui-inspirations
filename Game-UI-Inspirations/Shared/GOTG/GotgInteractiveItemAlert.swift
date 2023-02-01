//
//  GotgInteractiveItemAlert.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 1/24/23.
//

import SwiftUI
import Shapes

struct GotgInteractiveItemAlert: View {
@State private var isAnimating = false
  
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        triangles(in: proxy.frame(in: .local))
          .scaleEffect(isAnimating ? 1.5 : 1)
          .opacity(isAnimating ? 0 : 1)
          .animation(
            .linear(duration: 1).repeatForever(autoreverses: false),
            value: isAnimating
          )

        triangles(in: proxy.frame(in: .local))
        
        Circle()
          .scale(0.25)
          .stroke(lineWidth: dim / 50)
        
        StrokeStyledCircle(
          numberOfSegments: 3,
          dashPattern: [1, 9],
          lineWidth: 30,
          dashPhaseRatio: -0.2
        )
        .scale(0.23)
        
        Circle()
          .scale(0.1)
        
        let vertices = ConvexPolygon(sides: 3)
          .vertices(in: proxy.frame(in: .local)
            .insetBy(dx: dim * 0.27, dy: dim * 0.27))
        
        ForEach(0..<vertices.count, id:\.self) { index in
          let point = vertices[index]
          
          Circle().trim(from: 0, to: 0.5)
            .stroke(lineWidth: 30)
            .scaleEffect(0.15)
            .rotationEffect(.degrees((CGFloat(index)) * 120.0))
            .offset(x: -dim * 0.5 + point.x, y: -dim * 0.5 + point.y)
        }
        
      }
      .foregroundColor(.gotgGreen)
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
    .task {
      isAnimating = true
    }
  }
  
  func triangles(in rect: CGRect) -> some View {
    ZStack {
      let dim = min(rect.width, rect.height)
      
      let vertices = ConvexPolygon(sides: 3)
        .vertices(in: rect)
      
      ForEach(0..<vertices.count, id:\.self) { index in
        let point = vertices[index]
        
        ConvexPolygon(sides: 3)
          .scaleEffect(0.1)
          .offset(x: -dim * 0.5 + point.x, y: -dim * 0.5 + point.y)
      }
      
      StrokeStyledPolygon(
        sides: 3,
        dashes: 3,
        dashPattern: [7, 3],
        lineWidthRatio: 0.01,
        dashPhaseRatio: -0.15,
        lineCap: .square,
        lineJoin: .miter
      )
      .scale(1.1)
    }
  }
}

struct GotgInteractiveItemAlert_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.black.ignoresSafeArea()
      GotgInteractiveItemAlert()
        .frame(width: 256, height: 256)
    }
  }
}
