//
//  ACOQuestView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 9/3/22.
//

import SwiftUI
import Shapes

struct ACOBanner: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.move(to: .zero)
      path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
      path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + 0.85 * rect.height))
      path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
      path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + 0.85 * rect.height))
      path.closeSubpath()
    }
  }
  
  
}

struct ACOQuestView: View {
  var selected: Bool = false
  var title: String
  var subtitle: String
  var limitText: String
  
  var questMarker: some View {
    ZStack {
      let pointRatio = 0.55
      Kite(pointRatio: pointRatio)
        .stroke(Color.black, lineWidth: 2)
      Kite(pointRatio: pointRatio)
        .scale(0.9)
        .fill(Color.acoGoldAgain)
      
      Kite(pointRatio: pointRatio)
        .scale(0.66)
        .fill(Color.black)
      
      Kite(pointRatio: pointRatio)
        .scale(0.4)
        .fill(Color.acoGoldAgain)
      
      LinearGradient(colors: [.orange, .clear, .clear], startPoint: .bottom, endPoint: .top)
        .clipShape(      Kite(pointRatio: pointRatio)
        )
    }
  }
  // TODO: Dependent on quest type
  var shieldEngraving: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        StrokeStyledCircle(
          numberOfSegments: 50,
          dashPattern: [1, 4],
          lineWidthRatio: 0.1
        )
        .scale(1.1)
        
        StrokeStyledCircle(
          numberOfSegments: 6,
          dashPattern: [1, 0.5],
          lineWidthRatio: 0.025
        )
        .inset(by: dim * 0.15)
        
        StrokeStyledCircle(
          numberOfSegments: 6,
          dashPattern: [1, 0.5],
          lineWidthRatio: 0.025,
          dashPhaseRatio: 0.5
        )
        .inset(by: dim * 0.2)
        
        
        Diamond()
          .stroke(lineWidth: 2)
          .frame(width: dim * 0.5, height: dim * 0.8)
        
        Salinon()
          .inset(by: dim * 0.3)
      }
      .foregroundColor(.acoGoldAgain)
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
  
  var stencil: some View {
    Spirolateral(turns: [3], turningAngle: 79, repetitions: 20)
      .stroke(Color.gray.opacity(0.3), lineWidth: 0.5)
  }
  
  var body: some View {
    ZStack {
      Color.acoBlue
      
      stencil
        .scaleEffect(x: 5.3, y: 2)
        .offset(x: 100, y: -80)
        .clipShape(Rectangle())
      
      if selected {
        Color.black.opacity(0.3)
          .overlay {
            RoundedRectangle(cornerRadius: 20)
              .inset(by: 2)
              .foregroundColor(Color.acoGoldAgain.opacity(0.6))
              .blur(radius: 5)
          }
      }
      
      HStack(spacing: 20) {
        LinearGradient(colors: [.acoNotQuiteBlack, .acoGoldAgain], startPoint: .bottomLeading, endPoint: .topTrailing)
          .frame(width: 60, height: 64)
          .overlay(
            shieldEngraving
          )
          .clipShape(
            ACOBanner()
          )
          .overlay(
            ACOBanner()
              .stroke(Color.acoGoldAgain, lineWidth: 2)
          )
        
        VStack(alignment: .leading) {
          Text(title)
            .font(.system(size: 28, weight: .bold))
            .foregroundColor(.white)
          Text(subtitle)
            .font(.system(size: 20, weight: .medium))
            .foregroundColor(.red)
        }
        Spacer()
        VStack(spacing: 10) {
//          Image(systemName: "clock.fill")
//            .scaleEffect(x:-1)
          Group {
            if selected {
              questMarker
            } else {
              Color.clear
            }
          }
          .frame(width: 24, height: 32)
          
          Text(limitText)
            .font(.system(size: 20, weight: .medium))
        }
        .foregroundColor(.white)
        
      }
      .padding()
    }
  }
}

struct ACOQuestView_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      ACOQuestView(selected: false, title: "Secrets of the First Pyramids",
      subtitle: "Suggested level: 23",
      limitText: "4946 m")
        .frame(width: 512, height: 100)
      ACOQuestView(selected: true, title: "Secrets of the First Pyramids",
      subtitle: "Suggested level: 23",
      limitText: "4946 m")
        .frame(width: 512, height: 100)
    }
    .background(Color.acoBlue)
    .previewLayout(.sizeThatFits)
  }
}
