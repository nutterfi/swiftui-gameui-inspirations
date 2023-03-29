//
//  LASecretDungeonFloorPattern.swift
//  Game-UI-Inspirations (iOS)
//
//  Created by nutterfi on 3/1/22.
//

import SwiftUI
import Shapes

struct LASecretDungeonFloorPattern: View {
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          
          Circle()
            .fill(Color.lostArkLightBrown)
          
          Circle()
            .strokeBorder(Color.lostArkBrown, lineWidth: dim * 0.05)
          
          // Pseudo-clover shape
          let cloverLeaf = Egg()
            .frame(width: dim * 0.5, height: dim * 0.5)
            .offset(x: 0, y: dim * 0.25)
          ZStack {
            cloverLeaf
            cloverLeaf
              .rotationEffect(.radians(1.5 * .pi))
            cloverLeaf
              .rotationEffect(.radians(.pi))
            cloverLeaf
              .rotationEffect(.radians(.pi / 2))
          }
          .foregroundColor(Color.lostArkBrown)
          
          // Outer border pattern
          Group {
            Circle()
              .strokeBorder(Color.lostArkLightBrown, lineWidth: dim * 0.01)
              .shadow(color: .black, radius: 1, x: 1, y: 1)
            
            CirclePattern(pattern: Circle(), repetitions: 56)
              .fill(Color.lostArkLightBrown)
              .frame(width: dim * 0.95, height: dim * 0.95)
              .shadow(color: .black, radius: 1, x: 1, y: 1)

            
            Circle()
              .inset(by: dim * 0.05)
              .stroke(Color.lostArkLightBrown, lineWidth: dim * 0.01)
              .shadow(color: .black, radius: 1, x: 1, y: 1)
          }
          
          // Pizza Slices
          Group {
          
            StarPolygon(points: 8, density: 4)
              .stroke(Color.black, lineWidth: dim * 0.01)
              .rotationEffect(.radians(.pi / 8))
              .shadow(color: .black, radius: 1, x: 1, y: 1)

            let pattern = Salinon()
              .rotation(.radians(.pi))
            
            CirclePattern(
              pattern: pattern,
              repetitions: 4)
              .frame(width: dim * 0.7, height: dim * 0.7)
              .foregroundColor(Color.lostArkLightBrown)
              .shadow(color: .black, radius: 1, x: 1, y: 1)
            
          }
          
          // Inner circle
          Group {
            Circle()
              .inset(by: dim * 0.25)
              .fill(Color.lostArkBrown)
            
            Circle()
              .inset(by: dim * 0.25)
              .stroke(Color.lostArkLightBrown, lineWidth: dim * 0.01)
              .shadow(color: .black, radius: 1, x: 1, y: 1)
          }
          
          TriquetraView(lineWidth: dim * 0.01)
            .frame(width: dim * 0.4, height: dim * 0.4)
            .foregroundColor(Color.lostArkLightBrown)
            .offset(x: 0, y: -dim * 0.025)
            .shadow(color: .black, radius: 1, x: 1, y: 1)
          
          Circle()
            .inset(by: dim * 0.4)
            .stroke(Color.lostArkLightBrown, lineWidth: dim * 0.01)
            .shadow(color: .black, radius: 1, x: 1, y: 1)
          
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct LASecretDungeonFloorPatternDemo: View {
  @State private var animating = false
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        RadialGradient(colors: [.black, .kombatYellow], center: .center, startRadius: 0, endRadius: dim)
          .ignoresSafeArea()
        
        
        LASecretDungeonFloorPattern()
          .padding()
          .rotation3DEffect(.radians(animating ? 0 : 2 * .pi), axis: (x: 1, y: 1, z: 0))
          .animation(Animation.easeInOut(duration: 2).repeatForever(), value: animating)
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
      .task {
        animating = true
      }
    }
  }
}


struct LASecretDungeonFloorPattern_Previews: PreviewProvider {
    static var previews: some View {
      LASecretDungeonFloorPatternDemo()
    }
}
