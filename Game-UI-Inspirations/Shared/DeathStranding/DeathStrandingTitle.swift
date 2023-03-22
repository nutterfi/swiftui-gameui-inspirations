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
      ZStack(alignment: .top) {
        VStack(spacing: 0) {
          Text(letter)
            .font(.title)
            .foregroundColor(.gray)
          if let data = data {
            DataPath(data: data)
              .stroke()
              .rotation(.degrees(90), anchor: UnitPoint.top)
              .frame(height: dim * 0.05)
              .offset(x: 0, y: dim * 0.2)
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
              Color.clear.frame(width: dim * 0.25)
              DeathStrandingLetter(letter: "D")
              DeathStrandingLetter(
                letter: "E",
                data: Math.dampedOscillator(
                  points: 1000,
                  sampleRate: 1000,
                  dampingFactor: 0.001
                )
              )
              
              DeathStrandingLetter(
                letter: "A",
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
              DeathStrandingLetter(letter: "H")
              Color.clear.frame(width: dim * 0.25)
            }
          }
          
          HStack(spacing: 0) {
            Color.clear
            Group {
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
            }
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
            Color.clear
          }
          .offset(x: 0, y: proxy.size.height * 0.4)
        }
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct DeathStrandingTitle_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      DeathStrandingTitle()
        .previewInterfaceOrientation(.landscapeLeft)
      
      DeathStrandingLetter(
        letter: "E",
        data: Math.dampedOscillator(
          points: 1000,
          sampleRate: 1000,
          dampingFactor: 0.001
        )
      )
    }
  }
}
