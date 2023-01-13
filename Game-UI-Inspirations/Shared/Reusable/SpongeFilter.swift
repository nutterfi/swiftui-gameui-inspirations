//
//  SpongeFilter.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 1/12/23.
//

import SwiftUI

var randomPositions: [CGPoint] = {
  var positions = [CGPoint]()
  let x = SystemRandomNumberGenerator()
  for _ in 0..<100 {
    let x = CGFloat.random(in: 0...1)
    let y = CGFloat.random(in: 0...1)
    positions.append(CGPoint(x: x, y: y))
  }
  return positions
}()

struct SpongeFilter<S: Shape>: Shape {
  var base: S
  var size: CGFloat = 1.0
  
  
  func path(in rect: CGRect) -> Path {
    Path { path in
      
      var sponge = Path()
      randomPositions.forEach { position in
        let width = position.x * rect.width
        let height = position.y * rect.height
        
        sponge.addPath(Circle().path(in: .init(origin: .init(x: width, y: height), size: .init(width: size, height: size))))
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
      SpongeFilter(base: Circle(), size: 20)
      .frame(width: 256, height: 256)
    }
}
