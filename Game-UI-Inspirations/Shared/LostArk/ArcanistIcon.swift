//
//  ArcanistIcon.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 9/10/22.
//

import SwiftUI
import Shapes

struct ArcanistIcon: Shape {
  
  func dragonpath2(in rect: CGRect) -> Path {
    Path { path in
      let origin = CGPoint(x: 0.4 * rect.width, y: 0.25 * rect.height)
      
      path.move(to: origin)
      
      path.addCurve(
        to: CGPoint(x: path.currentPoint!.x + 0.15 * rect.width, y: path.currentPoint!.y - 0.02 * rect.height),
        control1: CGPoint(x: path.currentPoint!.x + 0.04 * rect.width, y: path.currentPoint!.y - 0.05 * rect.height),
        control2: CGPoint(x: path.currentPoint!.x + 0.13 * rect.width, y: path.currentPoint!.y - 0.02 * rect.height)
      )
      
      path.addQuadCurve(
        to: CGPoint(x: path.currentPoint!.x - 0.05 * rect.width, y: path.currentPoint!.y - 0.05 * rect.height),
        control: CGPoint(x: path.currentPoint!.x + 0.04 * rect.width, y: path.currentPoint!.y - 0.1 * rect.height)
      )
      
      // top of wing
      path.addCurve(
        to: CGPoint(x: path.currentPoint!.x + 0.2 * rect.width, y: path.currentPoint!.y - 0.12 * rect.height),
        control1: CGPoint(x: path.currentPoint!.x + 0.09 * rect.width, y: path.currentPoint!.y - 0.14 * rect.height),
        control2: CGPoint(x: path.currentPoint!.x + 0.12 * rect.width, y: path.currentPoint!.y - 0.1 * rect.height)
      )
      
      path.addQuadCurve(
        to: CGPoint(x: path.currentPoint!.x - 0.05 * rect.width, y: path.currentPoint!.y + 0.05 * rect.height),
        control: CGPoint(x: path.currentPoint!.x - 0.1 * rect.width, y: path.currentPoint!.y + 0.1 * rect.height)
      )
      
    }
  }
  
  func dragonpath(in rect: CGRect) -> Path {
    Path { path in
      let origin = CGPoint(x: 0.25 * rect.width, y: 0.25 * rect.height)
      
      path.move(to: origin)
      
      path.addRelativeArc(center: CGPoint(x: 0.25 * rect.width, y: 0.2 * rect.height), radius: 0.05 * rect.height, startAngle: .degrees(90), delta: .degrees(270))
      
      path.addLine(to: CGPoint(x: path.currentPoint!.x - 0.01 * rect.width, y: path.currentPoint!.y))
      
      path.addRelativeArc(center: CGPoint(x: 0.25 * rect.width, y: 0.2 * rect.height), radius: 0.04 * rect.height, startAngle: .zero, delta: .degrees(-230))
      
      path.addLine(to: CGPoint(x: path.currentPoint!.x + 0.08 * rect.width, y: path.currentPoint!.y))
      
      path.addOgeeCurve(
        to: CGPoint(x: path.currentPoint!.x + 0.1 * rect.width, y: path.currentPoint!.y - 0.1 * rect.height),
        controlX: 0.6)
      path.addQuadCurve(
        to: CGPoint(x: path.currentPoint!.x + 0.07 * rect.width, y: path.currentPoint!.y + 0.05 * rect.height),
        control: CGPoint(x: path.currentPoint!.x + 0.04 * rect.width, y: path.currentPoint!.y + 0.01 * rect.height)
      )
      
      path.addQuadCurve(
        to: CGPoint(x: path.currentPoint!.x - 0.074 * rect.width, y: path.currentPoint!.y + 0.07 * rect.height),
        control: CGPoint(x: path.currentPoint!.x - 0.09 * rect.width, y: path.currentPoint!.y + 0.01 * rect.height)
      )
      path.closeSubpath()
    }
  }
  
  func card(in rect: CGRect) -> Path {
    Path { path in
      let borderWidth = rect.width * 0.05
      let outerRect = rect
      let innerRect = rect.insetBy(dx: borderWidth, dy: borderWidth)
      let outer = Rectangle().path(in: outerRect)
      let inner = Rectangle().path(in: innerRect)
      let difference = outer.cgPath.subtracting(inner.cgPath)
      path.addPath(Path(difference))
    }
  }
  
  func trimmedStyledCircle(in rect: CGRect) -> Path {
    Path { path in
      let c = StrokeStyledCircle(
        numberOfSegments: 15,
        dashPattern: [4, 1],
        lineWidthRatio: 0.14,
        trim: (0, 0.2),
        dashPhaseRatio: 0.9
      )
      path.addPath(
        c.path(in:
                rect.insetBy(
                  dx: rect.width * 0.2,
                  dy: rect.height * 0.2
                ).offsetBy(dx: rect.width * -0.1, dy: rect.height * 0.1)
              )
      )
    }
  }
  
  func cardPattern(in rect: CGRect) -> Path {
    Path { path in
      var diamondRect = rect
      diamondRect.origin = .zero
      diamondRect = diamondRect.applying(CGAffineTransform(scaleX: 0.5, y: 0.5))
      
      let p = Diamond().path(in: diamondRect).offsetBy(dx: rect.minX, dy: rect.minY)
      path.addPath(p)
      path.addPath(p.offsetBy(dx: 0.5 * rect.width, dy: 0))
      path.addPath(p.offsetBy(dx: 0.5 * rect.width, dy: 0.5 * rect.height))
      path.addPath(p.offsetBy(dx: 0, dy: rect.height * 0.5))
    }
  }
  
  func path(in rect: CGRect) -> Path {
    Path { path in
      let cardRect = CGRect(
        x: rect.minX + 0.1 * rect.width,
        y: rect.minY + 0.25 * rect.height,
        width: rect.width * 0.3,
        height: rect.height * 0.5
      )
      path.addPath(card(in: cardRect))
      path.addPath(cardPattern(in: cardRect))
      path.addPath(trimmedStyledCircle(in: rect))
      path.addPath(dragonpath(in: rect))
      path.addPath(dragonpath2(in: rect))

    }
  }
}

struct ArcanistIcon_Previews: PreviewProvider {
    static var previews: some View {
        ArcanistIcon()
//        .stroke(lineWidth: 1)
        .frame(width: 512, height: 512)
        .border(Color.purple)
        .previewLayout(.sizeThatFits)
    }
}
