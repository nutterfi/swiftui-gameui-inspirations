//
//  HiFiRushBeatBar.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/9/23.
//

import SwiftUI
import Shapes

extension Color {
  static let hifiCyan = Color(red: 69/255, green: 252/255, blue: 236/255)
}

struct HiFiRushBeatBar: View {
  @State private var isAnimating = false
  let duration = 0.5
  
  @State private var filter = CIFilter(name: "CICMYKHalftone")!
  
  var body: some View {
    ZStack {
      
      lineView
      
      catHeadView
        .shadow(color: .hifiCyan, radius: 6)
      
      innerCircle

      leftSide

      rightSide
    }
    .frame(height: 100)
    .onAppear {
      isAnimating = true
    }
  }
  
  var catHeadView: some View {
    catHead
      .scale(isAnimating ? 1.5 : 1)
      .foregroundColor(isAnimating ? .black : .red)
      .animation(
        .easeOut(duration: 0.25)
        .repeatForever(autoreverses: true)
        , value: isAnimating
      )
      .frame(width: 100, height: 100)
  }
  
  var innerCircle: some View {
    Circle()
      .stroke(Color.hifiCyan, lineWidth: 10)
      .scaleEffect(isAnimating ? 1 : 0.6)
      .opacity(isAnimating ? 1 : 0)
      .animation(
        .linear(duration: 0.25)
        .repeatForever(autoreverses: true)
        , value: isAnimating
      )
      .frame(width: 75, height: 75)
  }
  
  var lineView: some View {
    HorizontalLine()
      .stroke(Color.hifiCyan, lineWidth: 10)
      .frame(maxWidth: .infinity)
      .scaleEffect(x: isAnimating ? 0.75 : 0.5)
      .shadow(color: .hifiCyan, radius: 25)
      .animation(
        .linear(duration: 0.25)
        .repeatForever(autoreverses: true)
        , value: isAnimating
      )
  }
  
  
  var catHead: some Shape {
    CompositeShape(
      base: Circle(),
      appendage: Arrowhead(
        controlPointRight: .init(x: 0.9, y: 0.5),
        controlPointLeft: .init(x: 0.1, y: 0.5)
      )
      .scale(x: 1.2)
      .rotation(.radians(.pi)))
  }
  
  var leftSide: some View {
    ZStack {
      let spacing: CGFloat = 175
      
      ForEach(0..<4) { index in
        let xOffset = -CGFloat(index + 1) * spacing
        let xOffsetEnd = -CGFloat(index) * spacing
        
        Circle()
          .trim(from: 0.25, to: 0.75)
        
          .stroke(Color.red, lineWidth: 10)
          .offset(isAnimating ? .init(width: xOffsetEnd, height: 0) : .init(width: xOffset, height: 0))
          .shadow(color: Color.hifiCyan, radius: 1)
          .scaleEffect(isAnimating && index == 0 ? 0.8 : 1)
          .animation(
            .linear(duration: duration)
            .repeatForever(autoreverses: false)
            , value: isAnimating
          )
      }
    }
  }
  
  var rightSide: some View {
    ZStack {
      let spacing: CGFloat = 175
      
      ForEach(0..<4) { index in
        let xOffset = CGFloat(index + 1) * spacing
        let xOffsetEnd = CGFloat(index) * spacing
        
        Circle()
          .trim(from: 0.25, to: 0.75)
          .rotation(.radians(.pi))
          .stroke(Color.red, lineWidth: 10)
          .offset(isAnimating ? .init(width: xOffsetEnd, height: 0) : .init(width: xOffset, height: 0))
          .scaleEffect(isAnimating && index == 0 ? 0.8 : 1)
          .shadow(color: Color.hifiCyan, radius: 1)
          .animation(
            .linear(duration: duration)
            .repeatForever(autoreverses: false)
            , value: isAnimating
          )
      }
    }
  }
}

struct HiFiRushBeatBar_Previews: PreviewProvider {
  static var previews: some View {
    ZStack(alignment: .center) {
      LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
        .ignoresSafeArea()
      VStack {
        Text("Scream Starting Soon")
          .foregroundColor(.hifiCyan)
          .font(.system(size: 80))
        Spacer()
        HiFiRushBeatBar()
          .padding(.vertical, 30)
      }
    }
    .previewLayout(.device)
  }
}
