//
//  AlanWakeSelectionView.swift
//  Game-UI-Inspirations (iOS)
//
//  Created by nutterfi on 10/27/22.
//

import SwiftUI

struct MirroredText: View {
  var text: String
  var rotation: CGFloat
  var axis: (x: CGFloat, y: CGFloat, z: CGFloat)
  var fontSize: CGFloat
  var anchor: UnitPoint = .center
  var anchorZ: CGFloat = .zero
  var perspective: CGFloat = 1
  
  var body: some View {
    ZStack() {
      Text(text)
        .font(.system(size: fontSize))
      Text(text)
        .font(.system(size: fontSize))
        .scaleEffect(y: -1)
        .rotation3DEffect(
          .degrees(rotation),
          axis: axis,
          anchor: anchor,
          anchorZ: anchorZ,
          perspective: perspective
        )
    }
  }
}

/// WIP
struct AlanWakeSelectionView: View {
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        Image(systemName: "sun.dust.fill")
          .resizable()
          .scaledToFill()
          .foregroundStyle(LinearGradient(colors: [.white, .alanWakeBlue, .black], startPoint: .top, endPoint: .bottom))
        
        Color.black.opacity(0.8).ignoresSafeArea()
        
        Image(systemName: "sun.dust.fill")
          .resizable()
          .scaledToFill()
          .foregroundStyle(LinearGradient(colors: [.white, .white, .white, .alanWakeBlue, .black], startPoint: .top, endPoint: .bottom))
          .blendMode(.overlay)
        //          .mask(
        VStack {
          
          Text("ALAN")
            .font(.system(size: 80))
          
          HStack {
            MirroredText(text: "W", rotation: 20, axis: (x: 1, y: 0, z: 0), fontSize: 120)
            MirroredText(text: "A",  rotation: 1, axis: (x: 0, y: 0, z: 1), fontSize: 120)
            MirroredText(text: "K",  rotation: 1, axis: (x: 0, y: 0, z: 1), fontSize: 120)
            MirroredText(text: "E",  rotation: 1, axis: (x: 0, y: 0, z: 1), fontSize: 120)
          }
          //                Text("WAKE")
          //                  .font(.system(size: 120))
          //                Text("WAKE")
          //                  .font(.system(size: 120))
          //                  .scaleEffect(y: -1)
          //                  .offset(y: -55)
          //                  .rotation3DEffect(.degrees(45), axis: (x: 1, y: 0, z: 0))
          
        }
        .bold()
        .foregroundColor(Color.white.opacity(0.7))
        //          )
        
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}


struct AlanWakeSelectionView_Previews: PreviewProvider {
  static var previews: some View {
    AlanWakeSelectionView()
  }
}
