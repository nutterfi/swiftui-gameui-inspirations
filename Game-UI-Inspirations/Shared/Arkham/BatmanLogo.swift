//
//  BatmanLogo.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 11/25/22.
//
// GOAL: A mirrored path that picks up where the first half left off, so we can perform a continuous trim and the end will be the same point as the start point.

import SwiftUI

struct BatmanLogo: Shape {
  
//  func path2(in rect: CGRect) -> Path {
//    Path { path in
//      let half = self.path(in: rect)
//
//      var elements = [Path.Element]()
//      var destinationPoints = [CGPoint]()
//
//      half.forEach { element in
//        elements.append(element)
//        switch element {
//        case .move(to: let point):
//          let reversedPoint = CGPoint(x: rect.maxX - point.x, y: point.y)
//          destinationPoints.append(reversedPoint)
//        case .quadCurve(to: let point, control: let control):
//          let reversedPoint = CGPoint(x: rect.maxX - point.x, y: point.y)
//          path.addQuadCurve(to: reversedPoint, control: control)
//        case .curve(to: let point, control1: let c1, control2: let c2):
//          let reversedPoint = CGPoint(x: rect.maxX - point.x, y: point.y)
//          path.addCurve(to: reversedPoint, control1: c1, control2: c2)
//        case .line(to: let point):
//          let reversedPoint = CGPoint(x: rect.maxX - point.x, y: point.y)
//          path.addLine(to: reversedPoint)
//        case .closeSubpath:
//          path.closeSubpath()
//        }
//      }
////      elements.reverse()
////      elements = [elements[0]]
//      // re-implementation of .scale(x: -1, y: 1) :/
//      let reversedPath = Path { path in
//        path.move(to: CGPoint(x: rect.midX, y: rect.height * 0.28))
//        elements.forEach { element in
//          switch element {
//          case .move(to: let point):
//            let reversedPoint = CGPoint(x: rect.maxX - point.x, y: point.y)
//            path.move(to: reversedPoint)
//
//          case .quadCurve(to: let point, control: let control):
//            let reversedPoint = CGPoint(x: rect.maxX - point.x, y: point.y)
//            let reversedC1 = CGPoint(x: rect.maxX - control.x, y: control.y)
//            path.addQuadCurve(to: reversedPoint, control: reversedC1)
//
//          case .curve(to: let point, control1: let c1, control2: let c2):
//            let reversedPoint = CGPoint(x: rect.maxX - point.x, y: point.y)
//            let reversedC1 = CGPoint(x: rect.maxX - c1.x, y: c1.y)
//            let reversedC2 = CGPoint(x: rect.maxX - c2.x, y: c2.y)
//            path.addCurve(to: reversedPoint, control1: reversedC1, control2: reversedC2)
//
//          case .line(to: let point):
//            let reversedPoint = CGPoint(x: rect.maxX - point.x, y: point.y)
//            path.addLine(to: reversedPoint)
//
//          case .closeSubpath:
//            path.closeSubpath()
//          }
//        }
//      }
//
//      path.addPath(path(in: rect))
////      path.addPath(reversedPath)
//
////      path.addPath(Path { path in
////        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
////        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
////      })
////      path.addPath(
////        halfPath(in: rect)
////          .scale(x: -1, y: 1)
////          .path(in: rect)
////      )
//    }
//  }
  
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.move(
        to: CGPoint(x: rect.midX, y: rect.height * 0.75)
      )
      
      // N - 6
      path.addQuadCurve(
        to: CGPoint(x: rect.width * 0.25, y: rect.height * 0.6),
        control: CGPoint(x: rect.width * 0.4, y: rect.height * 0.4)
      )
      
      // N - 5
      path.addQuadCurve(
        to: CGPoint(x: rect.width * 0.01, y: rect.height * 0.4),
        control: CGPoint(x: rect.width * 0.2, y: rect.height * 0.35)
      )
      
      // N - 4
      path.addQuadCurve(
        to: CGPoint(x: rect.width * 0.28, y: rect.height * 0.1),
        control: CGPoint(x: rect.width * 0.05, y: rect.height * 0.2)
      )
      
      // N - 3
      path.addQuadCurve(
        to: CGPoint(x: rect.width * 0.45, y: rect.height * 0.35),
        control: CGPoint(x: rect.width * 0.1, y: rect.height * 0.2)
      )
      
      // N - 2
      path.addLine(
        to: CGPoint(x: rect.width * 0.46, y: rect.height * 0.18)
      )
      // N - 1
      path.addLine(
        to: CGPoint(x: rect.width * 0.48, y: rect.height * 0.28)
      )
     
      // final line to the midpoint of the cowl
      path.addLine(
        to: CGPoint(x: rect.midX, y: rect.height * 0.28)
      )
      /// ----- reversal time!!!
      
      // N - 1
      path.addLine(
        to: CGPoint(x: rect.maxX - rect.width * 0.48, y: rect.height * 0.28)
      )
      
      // N - 2
      path.addLine(
        to: CGPoint(x: rect.maxX - rect.width * 0.46, y: rect.height * 0.18)
      )
      
      // N - 2.5?
      path.addLine(
        to: CGPoint(x: rect.maxX - rect.width * 0.45, y: rect.height * 0.35)
      )
      
      // N - 3*
      path.addQuadCurve(
        to: CGPoint(x: rect.width * (1 - 0.28), y: rect.height * 0.1), // This is the endpoint of the PREVIOUS quadcurve from the first half
        control: CGPoint(x: rect.width * (1 - 0.1), y: rect.height * 0.2)
      )
      
      // N - 4*
      path.addQuadCurve(
        to: CGPoint(x: rect.width * (1 - 0.01), y: rect.height * 0.4),
        control: CGPoint(x: rect.width * (1 - 0.05), y: rect.height * 0.2)
      )
      
      // N - 5*
      path.addQuadCurve(
        to: CGPoint(x: rect.width * (1 - 0.25), y: rect.height * 0.6),
        control: CGPoint(x: rect.width * (1 - 0.2), y: rect.height * 0.35)
      )
      
      // N - 6*
      path.addQuadCurve(
        to: CGPoint(x: rect.midX, y: rect.height * 0.75),
        control: CGPoint(x: rect.width * (1 - 0.4), y: rect.height * 0.4)
      )
      
      path = path.offsetBy(dx: 0, dy: rect.height * 0.1)
      
      
    }
  }
  
}

struct BatmanLogoSlider: View {
  @State private var trim: Float = 0.5
  @State private var isAnimating = false
  var body: some View {
    VStack {
      Slider(value: $trim)
      BatmanLogo()
        .trim(from: 0, to: CGFloat(trim))
        .stroke(style: StrokeStyle(lineWidth: 5, dash: [100, 10], dashPhase: isAnimating ? 110 : 0))
        .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: isAnimating)
        .background(
          BatmanLogo().fill(Color.black.opacity(0.3))
        )
    }
    .task {
      isAnimating.toggle()
    }
  }
}

struct BatmanLogo_Previews: PreviewProvider {
  static var previews: some View {
    BatmanLogoSlider()
      .frame(width: 256, height: 256)
      .previewLayout(.sizeThatFits)
  }
}
