//
//  Mora.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 10/21/21.
//

import SwiftUI
import Shapes

struct BendyTriangle: NFiShape {
  var inset: CGFloat = .zero
  var bendiness: CGFloat
  
  init(bendiness: CGFloat = .zero) {
    self.bendiness = bendiness
  }
  
  func path(in rect: CGRect) -> Path {
    let insetRect = rect.insetBy(dx: inset, dy: inset)
    let dim = min(insetRect.width, insetRect.height)
    let vertices = ConvexPolygon(sides: 3).vertices(in: insetRect)
    let mid = CGPoint(x: insetRect.midX, y: insetRect.midY)
    
    return Path { path in
      path.move(to: vertices.first!)
      path.addQuadCurve(to: vertices[1], control: CGPoint(x: mid.x + bendiness * dim, y: mid.y + bendiness * dim))
      path.addQuadCurve(to: vertices[2], control: mid)
      path.addQuadCurve(to: vertices[0], control: mid)
      path.closeSubpath()
    }
  }
  
  
}

struct Mora: View {
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          Circle()
            .foregroundColor(Color("giGold"))
          
          Circle()
            .inset(by: dim * 0.1)
            .stroke(Color("giBrown"), lineWidth: dim * 0.03)
          
          BendyTriangle()
            .inset(by: dim * 0.15)
            .stroke(Color("giBrown"), lineWidth: dim * 0.02)
            .rotationEffect(.radians(.pi))

          TriquetraView(lineWidth: dim * 0.1)
            .scaleEffect(0.8)
            .foregroundColor(Color("giGold"))
            .shadow(color: Color("giBrown"), radius: 5, x: 2, y: 2)
            .offset(x: 0, y: -dim * 0.08)
          
        }
        .overlay(
          LinearGradient(colors: [Color("giGold"), Color("giBronze")], startPoint: .topLeading, endPoint: .bottomTrailing)
            .rotationEffect(.degrees(25))
            .scaleEffect(1.2)
            .opacity(0.6)
            .clipShape(Circle())
        )
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct Mora_Previews: PreviewProvider {
    static var previews: some View {
      Mora()
        .frame(width: 256, height: 256)
        .previewLayout(.sizeThatFits)
    }
}
