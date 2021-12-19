//
//  Spider.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 12/18/21.
//

import SwiftUI

struct Spider: Shape {
  func body(in rect: CGRect) -> Path {
    Path { path in
      // DRAW RIGHT HALF
      
      // pincers
      path.move(to: CGPoint(x: rect.midX, y: rect.height * 0.3))
      
      path.addLine(
        to:
          CGPoint(
            x: path.currentPoint!.x + rect.width * 0.005,
            y: path.currentPoint!.y
          )
      )
      
      path.addQuadCurve(
        to: CGPoint(x: rect.width * 0.52, y: rect.height * 0.27),
        control: CGPoint(x: rect.width * 0.54, y: rect.height * 0.3)
      )
      
      path.addQuadCurve(
        to: CGPoint(x: rect.width * 0.53, y: rect.height * 0.32),
        control: CGPoint(x: rect.width * 0.57, y: rect.height * 0.3)
      )
      
      path.addLine(to: CGPoint(x: rect.width * 0.54, y: rect.height * 0.33))
      
      // front leg
      
      path.addLine(
        to: CGPoint(
          x: rect.width * 0.6,
          y: rect.height * 0.29
        )
      )
      
      path.addQuadCurve(
        to: CGPoint(x: rect.width * 0.6, y: rect.height * 0.12),
        control: CGPoint(x: rect.width * 0.62, y: rect.height * 0.2)
      )
      
      path.addQuadCurve(
        to: CGPoint(x: rect.width * 0.63, y: rect.height * 0.3),
        control: CGPoint(x: rect.width * 0.64, y: rect.height * 0.2)
      )
      
      path.addLine(to: CGPoint(x: rect.width * 0.55, y: rect.height * 0.35))
      
      // 2nd leg
      
      path.addLine(
        to:
          CGPoint(
            x: path.currentPoint!.x + rect.width * 0.001,
            y: path.currentPoint!.y + rect.height * 0.005
          )
      )
      
      path.addLine(
        to:
          CGPoint(
            x: path.currentPoint!.x + rect.width * 0.11,
            y: path.currentPoint!.y
          )
      )
      
      path.addQuadCurve(
        to: CGPoint(
          x: path.currentPoint!.x - rect.width * 0.01,
          y: path.currentPoint!.y - rect.height * 0.15
        ),
        control: CGPoint(x: rect.width * 0.67, y: rect.height * 0.35)
      )
      
      path.addQuadCurve(
        to: CGPoint(
          x: path.currentPoint!.x + rect.width * 0.03,
          y: path.currentPoint!.y + rect.height * 0.18
        ),
        control: CGPoint(x: rect.width * 0.7, y: rect.height * 0.35)
      )
      
      path.addLine(
        to:
          CGPoint(
            x: path.currentPoint!.x - rect.width * 0.13,
            y: path.currentPoint!.y - rect.height * 0.005
          )
      )
      
      // third leg
      
      path.addLine(
        to:
          CGPoint(
            x: path.currentPoint!.x - rect.width * 0.005,
            y: path.currentPoint!.y + rect.height * 0.01
          )
      )
      
      path.addQuadCurve(
        to: CGPoint(
          x: path.currentPoint!.x + rect.width * 0.18,
          y: path.currentPoint!.y + rect.height * 0.03
        ),
        control: CGPoint(x: rect.width * 0.7, y: rect.height * 0.4)
      )
      
      path.addQuadCurve(
        to: CGPoint(
          x: path.currentPoint!.x - rect.width * 0.18,
          y: path.currentPoint!.y + rect.height * 0.4
        ),
        control: CGPoint(x: rect.width * 0.71, y: rect.height * 0.64)
      )
      
      // from tip of third leg
      
      path.addQuadCurve(
        to: CGPoint(
          x: path.currentPoint!.x + rect.width * 0.14,
          y: path.currentPoint!.y - rect.height * 0.38
        ),
        control: CGPoint(x: rect.width * 0.66, y: rect.height * 0.64)
      )
      
      path.addLine(
        to:
          CGPoint(
            x: path.currentPoint!.x - rect.width * 0.14,
            y: path.currentPoint!.y - rect.height * 0.035
          )
      )
      
      // 4th leg
      
      path.addLine(
        to:
          CGPoint(
            x: path.currentPoint!.x + rect.width * 0.01,
            y: path.currentPoint!.y + rect.height * 0.01
          )
      )
      
      path.addLine(
        to:
          CGPoint(
            x: path.currentPoint!.x + rect.width * 0.1,
            y: path.currentPoint!.y + rect.height * 0.04
          )
      )
      
      path.addQuadCurve(
        to: CGPoint(
          x: path.currentPoint!.x - rect.width * 0.1,
          y: path.currentPoint!.y + rect.height * 0.3
        ),
        control: CGPoint(x: rect.width * 0.6, y: rect.height * 0.68)
      )
      
      path.addQuadCurve(
        to: CGPoint(
          x: path.currentPoint!.x + rect.width * 0.06,
          y: path.currentPoint!.y - rect.height * 0.285
        ),
        control: CGPoint(x: rect.width * 0.58, y: rect.height * 0.68)
      )
      
      path.addLine(
        to:
          CGPoint(
            x: path.currentPoint!.x - rect.width * 0.07,
            y: path.currentPoint!.y - rect.height * 0.045
          )
      )
      
      // BUTT
      
      path.addQuadCurve(
        to: CGPoint(
          x: rect.midX,
          y: path.currentPoint!.y + rect.height * 0.1
        ),
        control: CGPoint(x: rect.width * 0.57, y: rect.height * 0.48)
      )
    }
  }
  
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.addPath(body(in: rect))
      path.addPath(body(in: rect).scale(x: -1, y:1).path(in: rect))
      path.addPath(caboose(in: rect))
      path.addPath(caboose(in: rect).scale(x: -1, y:1).path(in: rect))
    }
  }
  
  // WIP
  func caboose(in rect: CGRect) -> Path {
    Path { path in
      path.move(
        to: CGPoint(
          x: rect.midX + rect.width * 0.01,
          y: rect.midY
        )
      )

      path.addLine(
        to:
          CGPoint(
            x: path.currentPoint!.x + rect.width * 0.27,
            y: path.currentPoint!.y + rect.height * 0.1
          )
      )

      path.addLine(
        to:
          CGPoint(
            x: path.currentPoint!.x + rect.width * 0.27,
            y: path.currentPoint!.y + rect.height * 0.1
          )
      )
      
    }
  }
  
}

struct Spider_Previews: PreviewProvider {
    static var previews: some View {
        Spider()
        .fill(Color.red)
        .frame(width: 512, height: 512)
    }
}
