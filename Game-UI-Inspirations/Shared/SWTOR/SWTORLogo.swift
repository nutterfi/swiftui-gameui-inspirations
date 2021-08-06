//
//  SWTORLogo.swift
//  SWTORLogo
//
//  Created by nutterfi on 8/3/21.
//

import SwiftUI

struct SWTORRepublicLogo: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      
    }
  }
  
}

struct SWTOREmpireLogo: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.move(to: CGPoint(x: rect.width * 0.5, y: rect.height * 0.1))
      path.addLine(to: CGPoint(x: rect.width * 0.6, y: rect.height * 0.18))
      
      path.addLine(to: CGPoint(x: rect.width * 0.59, y: rect.height * 0.2))
      
      path.addLine(to: CGPoint(x: rect.width * 0.55, y: rect.height * 0.18))
      
      path.addLine(to: CGPoint(x: rect.width * 0.525, y: rect.height * 0.35))
      
      // jut out now
      
      path.addLine(to: CGPoint(x: rect.width * 0.525, y: rect.height * 0.35))
      
      path.closeSubpath()
    }
  }
}

struct SWTORLogo: View {
  var color: Color = .black
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          Circle()
            .stroke(color, lineWidth: dim / 20)
            .frame(width: dim * 0.9, height: dim * 0.9)
          
          SWTORRepublicLogo()
          
//          SWTOREmpireLogo()
          StrokeStyledPolygon(sides: 6, dashes: 6, dashFillRatio: 0.7, lineWidthRatio: dim * 0.8 * 0.0001, dashPhaseRatio: 0.36, lineCap: .square)
            .foregroundColor(color)
            .frame(width: dim * 0.8, height: dim * 0.8)
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct SWTORLogo_Previews: PreviewProvider {
    static var previews: some View {
      SWTORLogo(color: Color.red)
    }
}
