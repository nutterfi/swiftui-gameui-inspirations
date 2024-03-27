//
//  GIHydro.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 11/23/21.
//

import SwiftUI

struct GIHydro: Shape {
  
  func path(in rect: CGRect) -> Path {
    Path { path in
      let dim = min(rect.height, rect.width)
      
      // big arc
      var big = Path()
      big.addArc(
        center: CGPoint(x: rect.midX, y: rect.midY),
        radius: dim / 2,
        startAngle: .degrees(-150),
        endAngle: .degrees(120),
        clockwise: false)
      
      big.addArc(
        center: CGPoint(x: rect.midX + 10, y: rect.midY - 10),
        radius: dim * 0.5,
        startAngle: .degrees(120),
        endAngle: .degrees(150),
        clockwise: true)
      
      
      big.move(to: CGPoint(x: dim * 0.25, y: dim * 0.75))
      big.addCurve(to: CGPoint(x: dim * 0.25, y: dim * 0.25),
                   control1: CGPoint(x: rect.maxX, y: rect.maxY),
                   control2: CGPoint(x: rect.maxX, y: rect.height * 0.2))
      
      big.addLine(to: CGPoint(x: big.currentPoint!.x, y: big.currentPoint!.y - dim * 0.1))
      
      big.addCurve(to: CGPoint(x: dim * 0.25, y: dim * 0.75),
                   control1: CGPoint(x: rect.maxX * 1.3, y: rect.maxY * 0.2),
                   control2: CGPoint(x: rect.maxX, y: rect.maxY))
      
//      big.addArc(
//        center: CGPoint(x: rect.midX, y: rect.midY),
//        radius: dim / 3,
//        startAngle: .degrees(-120),
//        endAngle: .degrees(-150),
//        clockwise: true)
      
      
      
      let bigArc = big.strokedPath(StrokeStyle(lineWidth: dim * 0.12, lineCap: .round, lineJoin: .round))
     
      // middle arc
      var middle = Path()
      middle.addArc(
        center: CGPoint(x: rect.midX, y: rect.height * 0.66),
        radius: 1 * dim / 3,
        startAngle: .degrees(-120),
        endAngle: .degrees(120),
        clockwise: false)
      let middleArc = middle.strokedPath(StrokeStyle(lineWidth: dim * 0.1, lineCap: .round, lineJoin: .round))
    
      // small arc
      var small = Path()
      small.addArc(
        center: CGPoint(x: rect.midX, y: rect.height * 0.7),
        radius: 1 * dim / 6,
        startAngle: .degrees(-15),
        endAngle: .degrees(-320),
        clockwise: true)
      let smallArc = small.strokedPath(StrokeStyle(lineWidth: dim * 0.05, lineCap: .round, lineJoin: .round))
      
      
      var circle = Path()
      circle.addArc(center: CGPoint(x: rect.width * 0.05, y: rect.midY), radius: dim * 0.06, startAngle: .zero, endAngle: .degrees(360), clockwise: true)
      
      var circle2 = Path()
      circle2.addArc(center: CGPoint(x: rect.width * 0.12, y: rect.height * 0.72), radius: dim * 0.05, startAngle: .zero, endAngle: .degrees(360), clockwise: true)
      // two options
      // 1. Draw each arc separately and close them
     // 2. array of points on an arc, draw curves conencting each, with variable length width
      
      path.addPath(big)
//      path.addPath(middleArc)
//      path.addPath(smallArc)
//      path.addPath(circle)
//      path.addPath(circle2)
    }
  }
  
    
}

struct GIHydro_Previews: PreviewProvider {
    static var previews: some View {
      GIHydro()
//        .fill(LinearGradient(colors: [.blue, .randomBlue], startPoint: .top, endPoint: .bottom))
        .stroke(Color.blue)
        .padding()
        .frame(width: 256, height: 256)
        .previewLayout(.sizeThatFits)
    }
}
