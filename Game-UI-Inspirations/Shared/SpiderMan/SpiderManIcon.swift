//
//  SpiderManIcon.swift
//  Game-UI-Inspirations (iOS)
//
//  Created by nutterfi on 11/30/21.
//

import SwiftUI
import Shapes

struct SpiderManEyeInner: Shape {
  func path(in rect: CGRect) -> Path {
    return Path { path in
      let startPoint = CGPoint(
        x: rect.minX,
        y: rect.height * 0.6
      )
      
      path.move(
        to: startPoint
      )
      
      // to the top right
      path.addQuadCurve(
        to: CGPoint(x: rect.width * 0.8, y: rect.minY),
        control: CGPoint(
          x: rect.width * 0.3,
          y: rect.height * 0.1
        )
      )
      
      // to the bottom right
      path.addQuadCurve(
        to: CGPoint(
          x: rect.minX + 0.6 * rect.width,
          y: rect.maxY
        ),
        control: CGPoint(
          x: rect.width * 1.3,
          y: rect.width * 1.3
        )
      )
      
      let control = CGPoint(
        x: rect.minX + 0.05 * rect.width,
        y: rect.height * 1.0)
      
      // back to one
      path.addQuadCurve(
        to: startPoint,
        control: control
      )
    }
  }
}

struct SpiderManWeb: NFiShape {
  var inset: CGFloat = .zero
  var sides: Int = 13
  var controlPointRatio: CGFloat = 0.5
  
  func path(in rect: CGRect) -> Path {
    let insetRect = rect.insetBy(dx: inset, dy: inset)
    return Path { path in
      let dim = min(insetRect.height, insetRect.width)
      let polygon = ConvexPolygon(sides: sides)
      let vertices = polygon.vertices(in: insetRect)
      
      let controlPoints = polygon.vertices(in: insetRect.insetBy(dx: dim * controlPointRatio, dy: dim * controlPointRatio), offset: .radians(-.pi / Double(sides)))
      
      path.move(to: vertices.first!)
      
      for (index, _) in vertices.enumerated() {
        path.addQuadCurve(
          to: vertices[(index + 1) % vertices.count],
          control: controlPoints[index]
        )
      }
    }
  }
}

struct SpiderManIcon : View {
  var lines: Int = 13
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        Circle().fill(Color.red)
        Circle().stroke(lineWidth: 10)
        IsotoxalPolygon(sides: lines * 2, innerRadius: 0)
          .stroke(lineWidth: 3)

        SpiderManWeb(sides: lines, controlPointRatio: 0.1)
          .stroke(lineWidth: 3)
        SpiderManWeb(sides: lines, controlPointRatio: 0.1)
          .inset(by: dim * 0.15)
          .stroke(lineWidth: 3)
        SpiderManWeb(sides: lines, controlPointRatio: 0.1)
          .inset(by: dim * 0.3)
          .stroke(lineWidth: 3)
        
        // RIGHT EYE
        Group {
        SpiderManEyeInner()
          .fill(Color.black)
          .frame(width: dim * 0.4, height: dim * 0.6)
        
        SpiderManEyeInner()
          .fill(Color.white)
          .frame(width: dim * 0.3, height: dim * 0.45)
        }
        .offset(x: dim * 0.23, y: 0)

        // LEFT EYE
        
        Group {
          SpiderManEyeInner()
            .fill(Color.black)
            .frame(width: dim * 0.4, height: dim * 0.6)
  
          SpiderManEyeInner()
            .fill(Color.white)
            .frame(width: dim * 0.3, height: dim * 0.45)
        }
        .scaleEffect(x: -1, y:1)
        .offset(x: -dim * 0.23, y: 0)
        
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
    .padding()
    .background(LinearGradient(colors: [.blue, .black], startPoint: .topLeading, endPoint: .bottomTrailing))
  }
}

struct SpiderManIcon_Previews: PreviewProvider {
  static var previews: some View {
    SpiderManIcon(lines: 13)
      .frame(width: 256, height: 256)
      .previewLayout(.sizeThatFits)
  }
}
