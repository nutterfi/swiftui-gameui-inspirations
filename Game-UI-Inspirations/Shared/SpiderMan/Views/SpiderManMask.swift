//
//  SpiderManMask.swift
//  Game-UI-Inspirations (iOS)
//
//  Created by nutterfi on 11/30/21.
//

import SwiftUI
import Shapes

struct SpiderManEye: Shape {
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

struct SpiderManMask: View {
  var lines: Int = 13
  var color: Color = .red
  var lineColor: Color = .black
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        Circle()
          .fill(color)
          
        Circle()
          .strokeBorder(lineColor, lineWidth: dim * 0.03)
        
        IsotoxalPolygon(sidePairs: lines, innerRadius: 0)
          .strokeBorder(lineColor, lineWidth: dim * 0.015)

        Torx(sides: lines, controlPointInset: 0.1)
          .strokeBorder(lineColor, style: StrokeStyle(lineWidth: dim * 0.018, lineCap: .round, lineJoin: .miter, miterLimit: 0, dash: [], dashPhase: 0))
        
        Torx(sides: lines, controlPointInset: 0.1)
          .inset(by: dim * 0.15)
          .stroke(lineColor, lineWidth: dim * 0.015)
        
        Torx(sides: lines, controlPointInset: 0.1)
          .inset(by: dim * 0.28)
          .stroke(lineColor, lineWidth: dim * 0.015)

        // RIGHT EYE
        Group {
        SpiderManEye()
          .fill(Color.black)
          .frame(width: dim * 0.4, height: dim * 0.6)
        
        SpiderManEye()
          .fill(Color.white)
          .frame(width: dim * 0.3, height: dim * 0.45)
        }
        .offset(x: dim * 0.23, y: 0)

        // LEFT EYE
        Group {
          SpiderManEye()
            .fill(Color.black)
            .frame(width: dim * 0.4, height: dim * 0.6)
  
          SpiderManEye()
            .fill(Color.white)
            .frame(width: dim * 0.3, height: dim * 0.45)
        }
        .scaleEffect(x: -1, y:1)
        .offset(x: -dim * 0.23, y: 0)
        
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
    
  }
}

struct SpiderManIcon_Previews: PreviewProvider {
  static var previews: some View {
    SpiderManMask(lines: 13)
      .frame(width: 256, height: 256)
      .previewLayout(.sizeThatFits)
  }
}
