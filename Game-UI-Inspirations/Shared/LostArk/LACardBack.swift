//
//  LACardBack.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/24/22.
//

import SwiftUI
import Shapes
// Explore Texture Backgrounds

struct LACardBack: View {
  
  var cardTexture: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        Group {
          // box layer
          Group {
            Rectangle()
              .inset(by: dim * 0.14)
              .strokeBorder(.white, lineWidth: dim * 0.01)
              .opacity(0.5)
            
            Rectangle()
              .strokeBorder(.white, lineWidth: dim * 0.01)
              .opacity(0.5)
              .frame(width: dim * 0.07, height: dim * 0.5)
              .offset(x: dim * 0.38, y: -dim * 0.375)
            
            Rectangle()
              .strokeBorder(.white, lineWidth: dim * 0.01)
              .opacity(0.5)
              .frame(width: dim * 0.07, height: dim * 0.5)
              .offset(x: -dim * 0.38, y: -dim * 0.375)
            
            Rectangle()
              .strokeBorder(.white, lineWidth: dim * 0.01)
              .opacity(0.5)
              .frame(width: dim * 0.07, height: dim * 0.5)
              .offset(x: -dim * 0.38, y: dim * 0.375)
            
            Rectangle()
              .strokeBorder(.white, lineWidth: dim * 0.01)
              .opacity(0.5)
              .frame(width: dim * 0.07, height: dim * 0.5)
              .offset(x: dim * 0.38, y: dim * 0.375)
          }
          
          AngularGradient(colors: [.black, .purple, .blue, .red, .black], center: .center)
            .opacity(0.3)
          
          // vertical notch layer
          Group {
            Rectangle()
              .strokeBorder(.white, lineWidth: dim * 0.01)
              .offset(x: dim * 0.2, y: -dim * 0.67)
              .frame(width: dim * 0.07, height: dim * 0.1)
            Rectangle()
              .strokeBorder(.white, lineWidth: dim * 0.01)
              .offset(x: -dim * 0.2, y: -dim * 0.67)
              .frame(width: dim * 0.07, height: dim * 0.1)
            
            Rectangle()
              .strokeBorder(.white, lineWidth: dim * 0.01)
              .offset(x: dim * 0.2, y: dim * 0.67)
              .frame(width: dim * 0.07, height: dim * 0.1)
            Rectangle()
              .strokeBorder(.white, lineWidth: dim * 0.01)
              .offset(x: -dim * 0.2, y: dim * 0.67)
              .frame(width: dim * 0.07, height: dim * 0.1)
          }
          
          .opacity(0.5)
          
          // horizontal notch layer
          Group {
            Rectangle()
              .strokeBorder(.white, lineWidth: dim * 0.01)
              .offset(x: dim * 0.52, y: -dim * 0.67)
            Rectangle()
              .strokeBorder(.white, lineWidth: dim * 0.01)
              .offset(x: -dim * 0.2, y: -dim * 0.67)
            Rectangle()
              .strokeBorder(.white, lineWidth: dim * 0.01)
              .offset(x: dim * 0.2, y: dim * 0.67)
            Rectangle()
              .strokeBorder(.white, lineWidth: dim * 0.01)
              .offset(x: -dim * 0.2, y: dim * 0.67)
          }
          .frame(width: dim * 0.1, height: dim * 0.07)
          .opacity(0.5)
        }
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
  
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        Color.black
        let grad = LinearGradient(colors: [.white, .hadesZeusYellow], startPoint: .leading, endPoint: .trailing)
        
        cardTexture
        
        // Icing
        Group {
          Circle()
            .inset(by: dim * 0.1)
            .strokeBorder(grad, lineWidth: dim * 0.03, antialiased: true)
          
          Circle()
            .inset(by: dim * 0.25)
            .strokeBorder(grad, lineWidth: dim * 0.03, antialiased: true)
          
          IsotoxalPolygon(sides: 16, innerRadius: 0)
            .inset(by: dim * 0.1)
            .strokeBorder(grad, lineWidth: dim * 0.03, antialiased: true)
            .shadow(color: Color.hadesZeusYellow, radius: 2, x: 1, y: 1)
            .shadow(color: Color.hadesZeusYellow, radius: 2, x: -1, y: -1)
          
          Capsule()
            .strokeBorder(grad, lineWidth: dim * 0.03, antialiased: true)
            .frame(width: dim * 0.2, height: dim * 0.1)
            .offset(x: dim * 0.48, y: dim * 0.6)
          
          Capsule()
            .strokeBorder(grad, lineWidth: dim * 0.03, antialiased: true)
            .frame(width: dim * 0.2, height: dim * 0.1)
            .offset(x: -dim * 0.48, y: -dim * 0.6)
          
          
          RoundedRectangle(cornerRadius: 10)
            .strokeBorder(grad, lineWidth: dim * 0.03, antialiased: true)
        }
      }
      .clipShape(RoundedRectangle(cornerRadius: 10))
      .frame(width: proxy.size.width, height: proxy.size.height)
      .shadow(color: .black, radius: 5, x: 1, y: 1)
    }
  }
}

struct LACardBack_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.white.ignoresSafeArea()
      LACardBack()
        .frame(width: 150, height: 230)
    }
    .previewLayout(.sizeThatFits)
    .frame(width: 250, height: 250)
    
  }
}
