//
//  JustCause4Compass.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 7/14/22.
//

import SwiftUI
import Shapes

struct JustCause4Compass: View {
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        IsotoxalPolygon(sides: 8, innerRadius: 0.2)
          .frame(width: dim * 0.7, height: dim * 0.7)
          .overlay {
            IsotoxalPolygon(sides: 8, innerRadius: 0.2)
              .stroke(Color.white, lineWidth: 5)
          }
          .rotationEffect(.degrees(45))
        
        
        TwoTonedIsotoxalPolygon(sides: 4, innerRadius: 0.2, color1: .white, color2: .black)
          .frame(width: dim, height: dim)
          .overlay {
            IsotoxalPolygon(sides: 8, innerRadius: 0.2)
              .stroke(Color.white, lineWidth: 5)
          }
        
        Circle()
          .frame(width: dim * 0.2)
          .foregroundColor(.white)
          .overlay {
            Circle().stroke(lineWidth: 20)
          }
        
        Circle()
          .frame(width: dim * 0.14)
        
        AngularGradient(colors: [.yellow, .green, .purple, .white, .yellow, .pink], center: .center)
          .mask(
            JustCause4CompassBorder()
              .frame(width: dim * 0.8, height: dim * 0.8)
          )
        
        
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct JustCause4Demo: View {
  var body: some View {
    ZStack {
      LinearGradient(colors: [.black, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
        .ignoresSafeArea()
      
      JustCause4Compass()
    }
    
  }
}

struct JustCause4Compass_Previews: PreviewProvider {
  static var previews: some View {
    JustCause4Demo()
    
  }
}
