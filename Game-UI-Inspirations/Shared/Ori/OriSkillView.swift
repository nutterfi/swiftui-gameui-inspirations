//
//  OriSkillView.swift
//  Game-UI-Inspirations (iOS)
//
//  Created by nutterfi on 6/16/22.
//

import SwiftUI

struct OriSkillView: View {
  var skill: OriSkill
  var locked: Bool = false
  @State private var loaded = false
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        Circle().foregroundColor(.black)
        Circle()
          .strokeBorder(lineWidth: 10)
          .opacity(locked ? 0.2 : 1)
        .foregroundColor(.white)
        
        image
          .resizable()
          .scaledToFit()
          .frame(width: dim * 0.5, height: dim * 0.5)
          .scaleEffect(loaded ? 0.9 : 1)
          .foregroundColor(.white)
          .opacity(locked ? 0.2 : 1)
          .animation(Animation.easeInOut(duration: 3).repeatForever(), value: loaded)
      }
      .task {
        loaded = true
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
  
  var image: Image {
    let imageName: String
    switch skill {
    case .spiritFlame:
      imageName = "lungs"
    case .wallJump:
      imageName = "allergens"
    case .chargeFlame:
      imageName = "microbe.fill"
    case .bash:
      imageName = "bandage"
    case .stomp:
      imageName = "giftcard"
    case .locked7:
      imageName = "cablecar"
    case .locked8:
      imageName = "bolt.fill.batteryblock"
    case .locked9:
      imageName = "lock.slash"
    case .locked10:
      imageName = "lock.shield.fill"
    case .locked11:
      imageName = "cloud.drizzle.fill"
    case .doubleJump:
      imageName = "character.bubble.ja"
    }
    return Image(systemName: imageName)
  }
}

struct OriSkillView_Previews: PreviewProvider {
  static var previews: some View {
    OriSkillView(skill: .locked11, locked: false)
      .background(Color.black)
  }
}
