//
//  ConsummateV.swift
//  Control-Loading-Animations
//
//  Created by nutterfi on 3/4/21.
//

import SwiftUI

struct ConsummateV: View {
  // Number of Vs
  // linewidth of each V
  var count: Int
  var lineWidth: CGFloat = 10.0
  var body: some View {
    GeometryReader { proxy in
      let size = proxy.size
      let deltaX: CGFloat = size.width * 0.5 / CGFloat(count)
      let deltaY: CGFloat = size.height / CGFloat(count)
      
      ForEach(0..<count, id:\.self) { index in
        Path { path in
          let start: CGPoint = CGPoint(x: CGFloat(index) * deltaX, y: 0)
          path.move(to: start)
          let midPointY: CGFloat = size.height - CGFloat(index) * deltaY
          path.addLine(to: CGPoint(x: size.width * 0.5, y: midPointY))
          
          path.addLine(to: CGPoint(x: size.width - start.x, y: 0))
        }
        .stroke(lineWidth: lineWidth)
      }
    }
  }
}

struct ConsummateV_Previews: PreviewProvider {
  static var previews: some View {
    ConsummateV(count: 10, lineWidth: 1)
      .frame(width: 200, height: 200)
      .foregroundColor(.red)
      
  }
}
