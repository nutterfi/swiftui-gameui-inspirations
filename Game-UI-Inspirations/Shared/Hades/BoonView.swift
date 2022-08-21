//
//  BoonView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/1/21.
//

import SwiftUI
import Shapes

struct Boon: Identifiable, Equatable {
  static let zeus = "zeus"
  static let ares = "ares"
  static let artemis = "artemis"
  static let hermes = "hermes"
  static let aphrodite = "aphrodite"
  static let poseidon = "poseidon"
  static let chaos = "chaos"
  static let dionysis = "dionysis"
  static let athena = "athena"
  static let demeter = "demeter"
  
  var id = UUID()
  var boon: String
}

struct BoonView: View {
  var boon: Boon
  var color: Color = Color.black.opacity(0.3)
  var polygonSides: Int = 12
  var polygonDensity: Int = 2
  
  @State private var isAnimating = false
  var shouldAnimate = false
  
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        StarPolygon(points: polygonSides, density: polygonDensity)
          .rotationEffect(.degrees(-90))
          .foregroundColor(color)
        
        view(for: boon.boon)
          .background(
            view(for: boon.boon).blur(radius: dim / 40)
          )
          .frame(width: dim * 0.8, height: dim * 0.8)
          .offset(x: 0, y: !shouldAnimate ? 0 : isAnimating ? dim / 20 : -dim / 20 )
          .animation(Animation.easeInOut(duration: 1).repeatForever(), value: isAnimating)
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
    .onAppear {
      DispatchQueue.main.async {
        if shouldAnimate {
          isAnimating = true
        }
      }
    }
    .onDisappear {
      isAnimating = false
    }
  }
  
  func view(for boon: String) -> some View {
    Group {
      switch boon {
      case Boon.zeus:
        LinearGradient(gradient: Gradient(colors: [.white, .hadesZeusYellow, .hadesZeusOrange, .hadesZeusYellow]), startPoint: .topLeading, endPoint: .bottomTrailing)
          .mask(
            ZeusBoon()
          )
        
      case Boon.poseidon:
        LinearGradient(gradient: Gradient(colors: [.blue, .white, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
          .mask(
            PoseidonBoon()
          )
        
      case Boon.aphrodite:
        LinearGradient(gradient: Gradient(colors: [.white, .hadesAphroditeMagenta, .hadesAphroditePink]), startPoint: .topLeading, endPoint: .bottomTrailing)
          .mask(
            AphroditeBoon()
          )
        
      case Boon.athena:
        LinearGradient(gradient: Gradient(colors: [.white, .hadesZeusYellow]), startPoint: .topLeading, endPoint: .bottomTrailing)
          .mask(
            AthenaBoon()
          )
        
      case Boon.artemis:
        LinearGradient(gradient: Gradient(colors: [.white, .hadesArtemisYellow, .hadesArtemisGreen]), startPoint: .topLeading, endPoint: .bottomTrailing)
          .mask(
            ArtemisBoon()
          )
        
      case Boon.hermes:
        LinearGradient(gradient: Gradient(colors: [.white, .hadesArtemisYellow, .hadesArtemisGreen]), startPoint: .topLeading, endPoint: .bottomTrailing)
          .mask(
            HermesBoon()
          )
        
      case Boon.ares:
        LinearGradient(gradient: Gradient(colors: [.hadesAresRed, .white, .hadesAresRed, .hadesAresRed]), startPoint: .topLeading, endPoint: .bottomTrailing)
          .mask(
            AresBoon()
          )
        
      case Boon.chaos:
        RadialGradient(colors: [.white, .hadesPurple], center: UnitPoint(x: 0.5, y: 0.6), startRadius: 0, endRadius: 80)
          .mask(
            ChaosBoon()
          )
        
      default:
        Image(systemName: "questionmark.circle")
          .resizable()
          .scaledToFit()
      }
    }
    
  }
  
}

struct BoonView_Previews: PreviewProvider {
  static var previews: some View {
    BoonView(boon: Boon(boon: Boon.ares))
      .background(Color.blue)
      .frame(width: 256, height: 256)
      .previewLayout(.sizeThatFits)
  }
}
