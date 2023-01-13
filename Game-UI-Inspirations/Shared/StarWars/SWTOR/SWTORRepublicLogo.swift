//
//  SWTORRepublicLogo.swift
//  SWTORRepublicLogo
//
//  Created by nutterfi on 8/12/21.
//

import SwiftUI

struct SWTORRepublicShape: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.move(to: CGPoint(x: rect.width * 0.35, y: rect.height * 0.6))
      path.addLine(to: CGPoint(x: rect.width * 0.35, y: rect.height * 0.45))
      path.addQuadCurve(to:
                          CGPoint(x: rect.width * 0.35, y: rect.height * 0.05), control:
                          CGPoint(x: rect.width * 0.1, y: rect.height * 0.25))
      
      // close that shape
      path.addQuadCurve(to:
                          CGPoint(x: rect.width * 0.35, y: rect.height * 0.6), control:
                          CGPoint(x: rect.width * -0.15, y: rect.height * 0.35))
      // 2nd "feather"
      path.move(to: CGPoint(x: rect.width * 0.38, y: rect.height * 0.75))
      path.addQuadCurve(to:
                          CGPoint(x: rect.width * 0.35, y: rect.height * 0.7), control:
                          CGPoint(x: rect.width * 0.4, y: rect.height * 0.75))
    
      
      path.addQuadCurve(to:
                          CGPoint(x: rect.width * 0.1, y: rect.height * 0.3), control:
                          CGPoint(x: rect.width * -0.01, y: rect.height * 0.35))
      
    }
  }
  
  
}

struct SWTORRepublicLogo: View {
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          SWTORRepublicShape()
            .stroke(Color.purple, lineWidth: 3)
            .frame(width: dim, height: dim)
            
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct SWTORRepublicLogo_Previews: PreviewProvider {
    static var previews: some View {
        SWTORRepublicLogo()
        .frame(width: 256, height: 256)
        .border(Color.purple)
    }
}
