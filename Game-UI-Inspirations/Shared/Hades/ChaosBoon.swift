//
//  ChaosBoon.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 8/20/22.
//

import SwiftUI
import Shapes

struct ChaosBoon: NFiShape {
  var inset: CGFloat = .zero
  
  func arrowPath(in rect: CGRect) -> Path {
    Path { path in
      path.move(
        to: CGPoint(
          x: rect.midX,
          y: rect.minY + rect.height * 0.03
        )
      )
      
      path.addLine(
        to: CGPoint(
          x: rect.midX + 0.1 * rect.width,
          y: rect.minY + 0.2 * rect.height
        )
      )
      
      path.addLine(
        to: CGPoint(
          x: rect.midX + 0.05 * rect.width,
          y: rect.minY + 0.21 * rect.height
        )
      )

      // base of arrow
      path.addLine(
        to: CGPoint(
          x: rect.midX + 0.01 * rect.width,
          y: rect.midY + 0.05 * rect.height
        )
      )

      path.addLine(
        to: CGPoint(
          x: rect.midX - 0.01 * rect.width,
          y: rect.midY + 0.05 * rect.height
        )
      )

      path.addLine(
        to: CGPoint(
          x: rect.midX - 0.05 * rect.width,
          y: rect.minY + 0.21 * rect.height
        )
      )
      
      path.addLine(
        to: CGPoint(
          x: rect.midX - 0.1 * rect.width,
          y: rect.minY + 0.2 * rect.height
        )
      )
      
      path.closeSubpath()
      
    }
  }
  
  func path(in rect: CGRect) -> Path {
    let insetRect = rect.insetBy(dx: inset, dy: inset)
    return Path { path in
      path.addPath(arrowPath(in: insetRect))
      
      path.addPath(
        arrowPath(in: insetRect)
          .scale(0.8)
          .rotation(.degrees(45))
          .offset(x: insetRect.width * 0.06, y: insetRect.height * 0.03)
          .path(in: insetRect)
      )
      
      path.addPath(
        arrowPath(in: insetRect)
          .scale(0.8)
          .rotation(.degrees(90))
          .offset(x: insetRect.width * 0.06, y: insetRect.height * 0.09)
          .path(in: insetRect)
      )
      
      path.addPath(
        arrowPath(in: insetRect)
          .scale(0.8)
          .rotation(.degrees(-90))
          .offset(x: insetRect.width * -0.06, y: insetRect.height * 0.09)
          .path(in: insetRect)
      )
      
      path.addPath(
        arrowPath(in: insetRect)
          .scale(0.8)
          .rotation(.degrees(-45))
          .offset(x: insetRect.width * -0.06, y: insetRect.height * 0.03)
          .path(in: insetRect)
      )
      
      path.addPath(centerPath(in: insetRect))
      path.addPath(bottomPath(in: insetRect))
    }
  }
  
  func bottomPath(in rect: CGRect) -> Path {
    Path { path in
      path.move(
        to: CGPoint(
          x: rect.midX,
          y: rect.midY + 0.28 * rect.height)
      )
      
      path.addCurve(
        to: CGPoint(
          x: rect.midX + 0.20 * rect.width,
          y: rect.midY + 0.2 * rect.height
        ),
      
        control1: CGPoint(
          x: rect.midX + 0.24 * rect.width,
          y: rect.maxY - 0.3 * rect.height
        ),
        control2: CGPoint(
          x: rect.midX + 0.15 * rect.width,
          y: rect.maxY - 0.35 * rect.height
        )
      )
      
      path.addCurve(
        to: CGPoint(
          x: rect.midX,
          y: rect.midY + 0.35 * rect.height
        ),
      
        control1: CGPoint(
          x: rect.midX + 0.18 * rect.width,
          y: rect.maxY - 0.22 * rect.height
        ),
        control2: CGPoint(
          x: rect.midX + 0.15 * rect.width,
          y: rect.maxY - 0.2 * rect.height
        )
      )
      
      // now we are at the bottom
      
      path.addCurve(
        to: CGPoint(
          x: rect.midX - 0.20 * rect.width,
          y: rect.midY + 0.2 * rect.height
        ),
      
        control1: CGPoint(
          x: rect.midX - 0.15 * rect.width,
          y: rect.maxY - 0.2 * rect.height
        ),
        control2: CGPoint(
          x: rect.midX - 0.18 * rect.width,
          y: rect.maxY - 0.22 * rect.height
        )
      )
      
      path.addCurve(
        to: CGPoint(
          x: rect.midX,
          y: rect.midY + 0.28 * rect.height
        ),
      
        control1: CGPoint(
          x: rect.midX - 0.15 * rect.width,
          y: rect.maxY - 0.35 * rect.height
        ),
        control2: CGPoint(
          x: rect.midX - 0.24 * rect.width,
          y: rect.maxY - 0.3 * rect.height
        )
      )
      
      path.closeSubpath()
    }
  }
  
  func centerPath(in rect: CGRect) -> Path {
    Path { path in
      path.move(
        to: CGPoint(
          x: rect.midX,
          y: rect.midY + 0.12 * rect.height)
      )
      
      path.addLine(
        to: CGPoint(
          x: rect.midX + 0.13 * rect.width,
          y: rect.midY + 0.15 * rect.height)
      )
      
      path.addCurve(
        to: CGPoint(
          x: rect.midX + 0.0 * rect.width,
          y: rect.midY + 0.25 * rect.height
        ),
      
        control1: CGPoint(
          x: rect.midX + 0.1 * rect.width,
          y: rect.maxY - 0.29 * rect.height
        ),
        control2: CGPoint(
          x: rect.midX + 0.05 * rect.width,
          y: rect.maxY - 0.25 * rect.height
        )
      )
      
      path.addCurve(
        to: CGPoint(
          x: rect.midX - 0.13 * rect.width,
          y: rect.midY + 0.15 * rect.height
        ),
        control1: CGPoint(
          x: rect.midX - 0.05 * rect.width,
          y: rect.maxY - 0.25 * rect.height
        ),
        control2: CGPoint(
          x: rect.midX - 0.1 * rect.width,
          y: rect.maxY - 0.29 * rect.height
        )
      )
      
      path.closeSubpath()
      
    }
  }
}
//137 134 207
struct ChaosBoon_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.gray.ignoresSafeArea()
      RadialGradient(colors: [.white, .hadesPurple], center: UnitPoint(x: 0.5, y: 0.6), startRadius: 0, endRadius: 80)
        .mask(
          ChaosBoon()
        )
        .overlay(
          ChaosBoon().stroke(lineWidth: 3)
        )
    }
    .frame(width: 256, height: 256)
    .previewLayout(.sizeThatFits)
  }
}

extension Color {
  static var hadesPurple: Color {
    Color(red: 137/255, green: 134/255, blue: 207/255)
  }
}
