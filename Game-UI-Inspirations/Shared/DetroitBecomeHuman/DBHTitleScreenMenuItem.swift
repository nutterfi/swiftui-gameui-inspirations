//
//  DBHTitleScreenMenuItem.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 9/21/21.
//

import SwiftUI
import Shapes

// TODO: Add to shapes library
struct IsoscelesTriangle: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.move(to: CGPoint(x: rect.midX, y: 0))
      path.addLine(to: CGPoint(x: rect.width, y: rect.height))
      path.addLine(to: CGPoint(x: 0, y: rect.height))
      path.closeSubpath()
    }
  }
}

struct DBHTitleScreenMenuItem: View {
  @State private var isSelected: Bool = false
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          
          QuadCorner(cornerRadius: 10)
            .stroke(lineWidth: 2)
            .opacity(isSelected ? 1.0 : 0.0)
            .scaleEffect(x: isSelected ? 1.2 : 2.4, y: isSelected ? 1.6 : 4)
            .animation(Animation.easeInOut(duration: 0.5), value: isSelected)
          
          // Black squares on midpoints
          Group {
            Color.black.frame(width: 5, height: 5)
              .offset(x: 0, y: proxy.size.height * 0.5)
            Color.black.frame(width: 5, height: 5)
              .offset(x: 0, y: -proxy.size.height * 0.5)
            
            Color.black.frame(width: 5, height: 5)
              .offset(x: proxy.size.width * 0.5, y: 0)
            Color.black.frame(width: 5, height: 5)
              .offset(x: -proxy.size.width * 0.5, y: 0)
          }
          
          Color.blue
          
          ZStack {
            ForEach(0...10, id: \.self) { index in
              IsoscelesTriangle()
                .rotation(.radians(index % 2 == 0 ? .pi : 0))
                .foregroundColor(Color.randomBlue)
                .opacity(0.3)
                .hueRotation(.degrees(isSelected ? 180 : 0))
                .animation(Animation.easeInOut(duration: 2).repeatForever(), value: isSelected)
                .frame(width: dim, height: dim)
                .offset(x: -proxy.size.width * 0.5 + CGFloat(index) * dim / 2, y: 0)
            }
          }
          .mask(Rectangle()
                  .frame(width: proxy.size.width, height: proxy.size.height)
          )
          HStack {
            Color.clear.frame(width: 10)
            Text("CONTINUE").foregroundColor(.white)
            Spacer()
          }

        }
        .frame(width: proxy.size.width, height: proxy.size.height)
        .onAppear {
          isSelected = true
        }
      }
    }
}

struct DBHTitleScreenMenuItem_Previews: PreviewProvider {
    static var previews: some View {
        DBHTitleScreenMenuItem()
        .frame(width: 256, height: 48)
    }
}
