//
//  DeathStrandingTitle.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 12/30/21.
//

import SwiftUI
import Shapes
/**
      TODO:
 View MODEL!!!!!!!
 
 */

struct DeathStrandingLetter: View {
  var letter: String
  var data: [CGFloat]?
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        VStack(spacing: 0) {
          Text(letter)
            .font(.system(size: 50))
            .foregroundColor(.gray)
          if let data = data {
            DataPath(data: data)
              .stroke()
              .rotation(.degrees(90), anchor: UnitPoint.top)
              .frame(width: dim * 2, height: dim * 0.1)
              .offset(x: 0, y: dim * 0.4)
          }
          Spacer()
        }
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}


struct DeathStrandingTitle: View {
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        LinearGradient(colors: [.gray, .black], startPoint: .topTrailing, endPoint: .bottomLeading)
        Group {
          Group {
            HStack(spacing: dim * 0.1) {
              Spacer()
              DeathStrandingLetter(letter: "D")
                .frame(width: dim * 0.1)
              DeathStrandingLetter(
                letter: "E",
                data: Math.dampedOscillator(
                  points: 1000,
                  sampleRate: 1000,
                  dampingFactor: 0.001
                )
              )
                .frame(width: dim * 0.1)
              
              DeathStrandingLetter(
                letter: "A",
                data: Math.dampedOscillator(
                  points: 1000,
                  sampleRate: 1000,
                  dampingFactor: 0.001
                )
              )
                .frame(width: dim * 0.1)
              
              DeathStrandingLetter(
                letter: "T",
                data: Math.dampedOscillator(
                  points: 1000,
                  sampleRate: 1000,
                  dampingFactor: 0.001
                )
              )
                .frame(width: dim * 0.1)
              DeathStrandingLetter(letter: "H")
                .frame(width: dim * 0.1)
              Spacer()
            }
            .frame(width: dim * 0.1, height: dim * 0.7)
          }
          
          HStack {
            DeathStrandingLetter(
              letter: "S",
              data: Math.dampedOscillator(
                points: 1000,
                sampleRate: 1000,
                dampingFactor: 0.001
              )
            )
            DeathStrandingLetter(
              letter: "T",
              data: Math.dampedOscillator(
                points: 1000,
                sampleRate: 1000,
                dampingFactor: 0.001
              )
            )
            DeathStrandingLetter(
              letter: "R"
            )
            DeathStrandingLetter(
              letter: "A"
            )
            DeathStrandingLetter(letter: "N")
            DeathStrandingLetter(letter: "D")
            DeathStrandingLetter(
              letter: "I",
              data: Math.dampedOscillator(
                points: 1000,
                sampleRate: 1000,
                dampingFactor: 0.001
              )
            )
            DeathStrandingLetter(
              letter: "N",
              data: Math.dampedOscillator(
                points: 1000,
                sampleRate: 1000,
                dampingFactor: 0.001
              )
            )
            DeathStrandingLetter(
              letter: "G",
              data: Math.dampedOscillator(
                points: 1000,
                sampleRate: 1000,
                dampingFactor: 0.001
              )
            )
          }
          .offset(x: 0, y: dim * 0.4)
        }
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct DeathStrandingTitle_Previews: PreviewProvider {
  static var previews: some View {
    DeathStrandingTitle()
      .previewInterfaceOrientation(.landscapeLeft)
  }
}
