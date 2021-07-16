//
//  AthenaBoon.swift
//  AthenaBoon
//
//  Created by nutterfi on 7/15/21.
//

import SwiftUI

struct AthenaBoonShape: Shape {
  func path(in rect: CGRect) -> Path {
    let midPoint = CGPoint(x: rect.midX, y: rect.midY)
    return Path { path in
      path.move(to: midPoint)
      path.addArc(center: midPoint, radius: rect.width * 0.5, startAngle: .zero, endAngle: .degrees(360), clockwise: false)
      path.closeSubpath()
    }
  }
   
}

struct AthenaBoon: View {
  
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        Circle()
          .stroke(lineWidth: dim * 0.15)
          .frame(width: dim * 0.25, height: dim * 0.25)
        
        Circle()
          .stroke(lineWidth: dim * 0.05)
          .frame(width: dim * 0.5, height: dim * 0.5)
        
        Circle()
          .fill()
          .frame(width: dim * 0.1, height: dim * 0.1)
          .offset(x: 0, y: dim * 0.35)
        
        Circle()
          .fill()
          .frame(width: dim * 0.1, height: dim * 0.1)
          .offset(x: 0, y: -dim * 0.35)
        
        Circle()
          .fill()
          .frame(width: dim * 0.1, height: dim * 0.1)
          .offset(x: -dim * 0.35, y: 0)
        
        Circle()
          .fill()
          .frame(width: dim * 0.1, height: dim * 0.1)
          .offset(x: dim * 0.35, y: 0)
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct AthenaBoon_Previews: PreviewProvider {
    static var previews: some View {
      AthenaBoon()
        .foregroundColor(.hadesZeusYellow)
        .border(Color.black)
        .frame(width: 200, height: 200)
        .padding()
    }
}
