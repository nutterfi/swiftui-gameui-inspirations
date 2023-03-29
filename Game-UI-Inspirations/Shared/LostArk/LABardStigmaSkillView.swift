//
//  LABardStigmaSkillView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 3/8/22.
//

import SwiftUI
import Shapes

struct LABardStigmaSkillView: View {
  var color: Color = .purple
  var centerColor: Color = .blue
  @State private var animating = false
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          ForEach(0..<5, id: \.self) { index in
            Circle()
              .inset(by: CGFloat(index) * 0.02 * dim)
              .stroke(color, lineWidth: dim * 0.005)
              .shadow(color: .white, radius: 1, x: 1, y: 1)
          }
          .padding()
          
          CirclePattern(
            pattern: TrebleClef(),
            repetitions: 4)
            .stroke(lineWidth: dim * 0.005)
            .frame(width: dim * 0.92, height: dim * 0.92)
            .rotationEffect(.degrees(animating ? -360 : 0))
            .animation(Animation.linear(duration: 60).repeatForever(autoreverses: false), value: animating)
          
          RadialGradient(colors: [centerColor, .clear], center: .center, startRadius: 0, endRadius: dim * 0.75)
            .frame(width: dim * 0.75, height: dim * 0.75)
            .mask(Circle().blur(radius: 10))
            .opacity(animating ? 1.1 : 0.5)
            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: true), value: animating)
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
      .task {
        animating.toggle()
      }
    }
}

/**
 Drag Gesture on a SkillView
 when it goes out of bounds, change its color to RED
 */
struct LABardStigmaSkillDemo: View {
  @State private var position: CGPoint = .zero
  @State private var outOfBounds = false
  
  @GestureState private var isDragging = false
  var body: some View {
    
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        Circle()
          .stroke(lineWidth: 1)
          .frame(width: dim * 0.8, height: dim * 0.8)
        
        LABardStigmaSkillView(color: outOfBounds ? .red : .purple, centerColor: outOfBounds ? .red : .blue)
          .frame(width: dim * 0.4, height: dim * 0.4)
          .position(position)
          .gesture(
            DragGesture()
              .onChanged({ value in
                self.position = value.location
                self.outOfBounds = value.location.x < 200
              })
              .updating($isDragging, body: { value, state, transaction in
                state = true
              })
          )
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct LABardStigmaSkillView_Previews: PreviewProvider {
    static var previews: some View {
      LABardStigmaSkillView()
      .frame(width: 256, height: 256)
    }
}
