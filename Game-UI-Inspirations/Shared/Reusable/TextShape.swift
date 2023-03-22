//
//  TextShape.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 1/13/22.
//

import SwiftUI
import Shapes

// DEMO purposes only, not practical (YET?)
struct TextShape: NFiShape {
  var letter: String = ""
  var inset: CGFloat = .zero
  
  func path(in rect: CGRect) -> Path {
    Path { thePath in
      guard !rect.isEmpty else { return }
      let insetRect = rect.insetBy(dx: inset, dy: inset)
      thePath.addPath(path(rect: insetRect, char: letter))
    }
  }
  
  func path(rect: CGRect, char: String) -> Path {
    switch char {
    case "p": return TextShape.p(rect: rect)
    case "e": return TextShape.e(rect: rect)
    case "r": return TextShape.r(rect: rect)
    case "s": return TextShape.s(rect: rect)
    case "o": return TextShape.o(rect: rect)
    case "n": return TextShape.n(rect: rect)
    case "a": return TextShape.a(rect: rect)
    case "5": return TextShape.five(rect: rect)

    default: return Reuleaux.triangle.path(in: rect)
    }
  }
  
  static func p(rect: CGRect) -> Path {
    Path { path in
      path.move(to: CGPoint(x: rect.minX + rect.width * 0.3, y: rect.maxY - rect.height * 0.1))
      path.addLine(to: CGPoint(x: path.currentPoint!.x, y: rect.minY + rect.height * 0.1))
      path.addQuadCurve(
        to: CGPoint(x: path.currentPoint!.x, y: rect.midY),
        control: CGPoint(x: rect.maxX - rect.width * 0.0, y: rect.minY + 0.25 * rect.height)
      )
    }
  }
  
  static func e(rect: CGRect) -> Path {
    Path { path in
      var p1 = Path()
      p1.move(to: CGPoint(x: rect.minX + rect.width * 0.3, y: rect.maxY - rect.height * 0.1))
      p1.addLine(to: CGPoint(x: p1.currentPoint!.x, y: rect.minY + rect.height * 0.1))
      path.addPath(p1)
      
      var p2 = Path()
      p2.move(to: CGPoint(x: rect.minX + rect.width * 0.3, y: rect.maxY - rect.height * 0.1))
      p2.addLine(to: CGPoint(x: p2.currentPoint!.x + rect.width * 0.3, y: p2.currentPoint!.y))
      path.addPath(p2)
      
      var p3 = Path()
      p3.move(to: CGPoint(x: rect.minX + rect.width * 0.3, y: rect.midY))
      p3.addLine(to: CGPoint(x: p3.currentPoint!.x + rect.width * 0.3, y: p3.currentPoint!.y))
      path.addPath(p3)
      
      var p4 = Path()
      p4.move(to: CGPoint(x: rect.minX + rect.width * 0.3, y: rect.minY + rect.height * 0.1))
      p4.addLine(to: CGPoint(x: p4.currentPoint!.x + rect.width * 0.3, y: p4.currentPoint!.y))
      path.addPath(p4)
      
    }
  }
  
  static func r(rect: CGRect) -> Path {
    Path { path in
      path.move(to: CGPoint(x: rect.minX + rect.width * 0.3, y: rect.maxY - rect.height * 0.1))
      path.addLine(to: CGPoint(x: path.currentPoint!.x, y: rect.minY + rect.height * 0.1))
      path.addQuadCurve(
        to: CGPoint(x: path.currentPoint!.x, y: rect.midY),
        control: CGPoint(x: rect.maxX - rect.width * 0.0, y: rect.minY + 0.25 * rect.height)
      )
      path.addLine(to: CGPoint(x: path.currentPoint!.x + rect.width * 0.4, y: rect.maxY - rect.height * 0.1))
    }
  }
  
  static func s(rect: CGRect) -> Path {
    Path { path in
      path.move(to: CGPoint(x: rect.minX + rect.width * 0.3, y: rect.maxY - rect.height * 0.1))
      path.addSCurve(
        to: CGPoint(x: rect.minX + rect.width * 0.6, y: rect.minY + rect.height * 0.1),
        control1: CGPoint(x: rect.maxX, y: rect.midY),
        control2: CGPoint(x: rect.minX, y: rect.midY)
      )
    }
  }
  
  static func o(rect: CGRect) -> Path {
    Path { path in
      path.addEllipse(in: rect.insetBy(dx: 0.2 * rect.width, dy: 0.1 * rect.height))
    }
  }
  
  static func n(rect: CGRect) -> Path {
    Path { path in
      path.move(to: CGPoint(x: rect.minX + rect.width * 0.3, y: rect.maxY - rect.height * 0.1))
      path.addLine(to: CGPoint(x: path.currentPoint!.x, y: rect.minY + rect.height * 0.1))
      path.addLine(to: CGPoint(x: path.currentPoint!.x + rect.width * 0.4, y: rect.maxY - rect.height * 0.1))
      path.addLine(to: CGPoint(x: path.currentPoint!.x, y: rect.minY + rect.height * 0.1))
    }
  }
  
  static func a(rect: CGRect) -> Path {
    Path { path in
      path.move(to: CGPoint(x: rect.minX + rect.width * 0.3, y: rect.maxY - rect.height * 0.1))
      path.addLine(to: CGPoint(x: rect.midX, y: rect.minY + rect.height * 0.1))
      path.addLine(to: CGPoint(x: path.currentPoint!.x + rect.width * 0.3, y: rect.maxY - rect.height * 0.1))
      
      var p = Path()
      p.move(to: CGPoint(x: rect.minX + 0.4 * rect.width, y: rect.midY))
      p.addLine(to: CGPoint(x: rect.minX + 0.6 * rect.width, y: rect.midY))
      path.addPath(p)
    }
  }
  
  static func five(rect: CGRect) -> Path {
    Path { path in
      path.move(to: CGPoint(x: rect.minX + rect.width * 0.6, y: rect.minY + rect.height * 0.1))
      path.addLine(to: CGPoint(x: rect.minX + rect.width * 0.3, y: rect.minY + rect.height * 0.1))
      path.addLine(to: CGPoint(x: path.currentPoint!.x, y: rect.midY))
      path.addQuadCurve(
        to: CGPoint(x: path.currentPoint!.x, y: rect.maxY - 0.1 * rect.height),
        control: CGPoint(x: rect.maxX - rect.width * 0.0, y: rect.minY + 0.25 * rect.height)
      )
     
    }
  }
  
}

extension InsettableShape {
  func outline() -> some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        self
          .inset(by: dim * 0.05)
          .stroke(
            .white,
            style: StrokeStyle(
              lineWidth: dim * 0.1,
              lineCap: .round,
              lineJoin: .round
            )
          )
          .background(
            self
            
              .stroke(
                style: StrokeStyle(
                  lineWidth: dim * 0.4,
                  lineCap: .round,
                  lineJoin: .round
                )
              )
          )
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct TextShape_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.gray.ignoresSafeArea()
      HStack(spacing: 0) {
        Group {
          TextShape(letter: "p")
            .outline()
          TextShape(letter: "e")
            .outline()
          TextShape(letter: "r")
            .outline()
          TextShape(letter: "s")
            .outline()
          TextShape(letter: "o")
            .outline()
          TextShape(letter: "n")
            .outline()
          TextShape(letter: "a")
            .outline()
          TextShape(letter: "5")
            .outline()
        }
        .frame(width: 32)
        
      }
      .frame(height: 64)
      .background(
      Parallelogram(pct: 0.3)
        .foregroundColor(.red)
        .frame(height: 80)
      )
        
    .border(.purple)
    }
  }
}
