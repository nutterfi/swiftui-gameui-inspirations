//
//  STFCTutorialArrow.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 12/29/22.
//

import SwiftUI
import Shapes

fileprivate struct STFCChevron: Shape {
  var offset: CGFloat = 0.25
  func path(in rect: CGRect) -> Path {
    Path { path in
      let tPath = ConvexPolygon(sides: 3).path(in: rect)
      
      let cgTPath = tPath.cgPath
      
      let pathToCull = tPath
        .path(in: rect)
        .offset(x: 0, y: rect.height * offset)
        .path(in: rect)
      let subtractedPath = cgTPath.subtracting(pathToCull.cgPath)
      path.addPath(Path(subtractedPath))
    }
  }
}

let stfcYellow = Color(red: 251/255, green: 247/255, blue: 109/255)

struct STFCTutorialArrow: View {
  @State private var isAnimating = false
  var body: some View {
    ZStack {
      Group {
        STFCChevron()
          .fill(
            LinearGradient(colors: [stfcYellow, .black], startPoint: .top, endPoint: .bottom)
          )
        
        STFCChevron(offset: 0.15)
          .scale(x: 0.7, y: 0.7, anchor: .top)
          .offset(y: 8)
          .fill(stfcYellow)
          .shadow(color: .black, radius: 1)
      }
      .offset(y: isAnimating ? 0 : 20)
      .animation(.easeInOut(duration: 1).repeatForever(), value: isAnimating)
    
      
      Arrowhead(midPoint: .init(x: 0.5, y: 0.85))
        .scale(x: 0.4, y: 0.35)
        .offset(y: isAnimating ? 0 : 20)
        .fill(Color.white.opacity(0.1))
        .shadow(color: .white, radius: 5)
        .animation(
          .easeInOut(duration: 1)
          .repeatForever(),
          value: isAnimating
        )
      
      Arrowhead(midPoint: .init(x: 0.5, y: 0.85))
        .scale(x: 0.4, y: 0.35)
        .offset(x: 0, y: 5)
        .fill(stfcYellow)
        .offset(y: isAnimating ? 0 : 20)
        .animation(
          .easeInOut(duration: 0.5)
          .delay(0.5)
          .repeatForever(),
          value: isAnimating
        )
      
    }
    .shadow(color: Color.yellow.opacity(1.0), radius: 50)
    .frame(width: 100, height: 100)
    .task {
      isAnimating = true
    }
  }
}

struct STFCTutorialArrow_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.black.ignoresSafeArea()
      STFCTutorialArrow()
        .rotationEffect(.degrees(225))
    }
    
    .frame(width: 256, height: 256)
  }
}
