//
//  StarTrekFleetCommand.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 12/27/22.
//

import SwiftUI
import Shapes

struct StarTrekInsignia: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.move(to: .init(x: rect.minX, y: rect.maxY))
      path.addQuadCurve(to: .init(x: rect.midX, y: rect.minY), control: .init(x: rect.width * 0.35, y: rect.height * 0))
      path.addQuadCurve(to: .init(x: rect.maxX, y: rect.height * 0.9), control: .init(x: rect.width * 0.65, y: rect.minY))
      
      path.addQuadCurve(to: .init(x: rect.minX, y: rect.maxY), control: .init(x: rect.width * 0.6, y: rect.height * 0.4))
    }
  }
}


struct StarTrekFleetCommand: View {
  @State private var isAnimating = false
  var body: some View {
    ZStack {
      Color.gray.ignoresSafeArea()
      ZStack {
        Ellipse()
          .rotation(.degrees(90))
          .stroke(lineWidth: 5)
        StarTrekInsignia()
          .fill(AngularGradient(colors: [.red,.orange, .yellow, .green, .blue, .purple], center: .center))
          .hueRotation(.degrees(isAnimating ? 360 : 0))
          .shadow(color: .white, radius: 10)
          .overlay(
            StarTrekInsignia()
              .stroke(Color.black, lineWidth: 5)
          )
          .animation(.easeInOut(duration: 1).repeatForever(autoreverses: false), value: isAnimating)
        StarPolygon(points: 5, density: 2)
          .scale(0.25)
        
        Arrowhead()
          .scale(x: 0.1, y: 0.5)
          .offset(y: -50)
      }
      .frame(width: 200, height: 256)
    }
    .task {
      isAnimating = true
    }
  }
}

struct StarTrekFleetCommand_Previews: PreviewProvider {
  static var previews: some View {
    StarTrekFleetCommand()
  }
}
