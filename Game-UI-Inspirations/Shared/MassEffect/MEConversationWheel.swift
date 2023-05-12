//
//  MEConversationWheel.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/11/23.
//

import SwiftUI
import Shapes

extension View {
  func frame(square: Double) -> some View {
    self.frame(width: square, height: square)
  }
}

// IDEA! Use this as an overlay for Channel Polls!
struct MEConversationWheel: View {
  
  var circlePattern: some View {
    Circle()
      .inset(by: 25)
      .stroke(lineWidth: 50)
      .subtracting(
        StarPolygon(points: 6, density: 3)
          .stroke(lineWidth: 10)
      )
      .foregroundColor(.jfoCopper)
      .frame(square: 256)
  }
  
    var body: some View {
      ZStack {
        LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
        circlePattern
          .rotationEffect(.radians(.pi / 3))
          .background(
            Circle()
              .inset(by: 25)
              .stroke(lineWidth: 60)
              .offset(y: 2)
          )
        .rotation3DEffect(.degrees(30), axis: (x: 1, y: 0, z: 0))
      
      }
      .scaleEffect(2)
      .padding()
    }
}

struct MEConversationWheel_Previews: PreviewProvider {
    static var previews: some View {
        MEConversationWheel()
    }
}
