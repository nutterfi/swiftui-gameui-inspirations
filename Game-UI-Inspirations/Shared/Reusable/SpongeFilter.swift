//
//  SpongeFilter.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 1/12/23.
//

import SwiftUI
import Shapes

struct SpongeFilter<S: Shape, T: Shape>: Shape {
  var base: S
  var amount: Int = 100
  var size: CGFloat = 1.0
  var stencil: T
  
  static func randomPositions(number: Int = 100) -> [CGPoint] {
    var positions = [CGPoint]()
    var g = SystemRandomNumberGenerator()
    for _ in 0..<number {
      let x = CGFloat.random(in: 0...1, using: &g)
      let y = CGFloat.random(in: 0...1, using: &g)
      positions.append(CGPoint(x: x, y: y))
    }
    return positions
  }
  
  func path(in rect: CGRect) -> Path {
    Path { path in
      
      var sponge = Path()
      Self.randomPositions(number: amount).forEach { position in
        let width = position.x * rect.width
        let height = position.y * rect.height
        sponge.addPath(
          stencil.path(
            in: CGRect(
              origin: CGPoint(x: rect.minX + width - size / 2, y: rect.minY + height - size / 2),
              size: CGSize(width: size, height: size)
            )
          )
        )
      }
      
      let cgSponge = sponge.cgPath
      
      let cgBase = base.path(in: rect).cgPath
      
      let difference = cgBase.subtracting(cgSponge)
      
      path.addPath(Path(difference))
    }
  }
}

struct SpongeFilter_Previews: PreviewProvider {
    static var previews: some View {
      SpongeFilter(
        base: Rectangle(),
        amount: 1000,
        size: 20,
        stencil: BatmanLogo())
      .frame(width: 256, height: 256)
    }
}
