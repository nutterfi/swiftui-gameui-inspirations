//
//  POIMarker.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 4/22/21.
//

import SwiftUI
import Shapes

struct POIMarkerType {
  static let dialogue = "dialogue"
  static let objectInteract = "objectInteract"
}

struct POIMarker: View {
  
  var markerType: String
  
  func view(for markerType: String) -> some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        switch markerType {
        case POIMarkerType.dialogue:
          Crescent()
            .fill(Color.tlouSecondary)
            .frame(width: proxy.size.width * 0.4, height: proxy.size.height * 0.3)
            .scaleEffect(-1)
            .offset(x: -dim / 4, y: 0)
          
          Crescent()
            .fill(Color.tlouSecondary)
            .frame(width: proxy.size.width * 0.4, height: proxy.size.height * 0.3)
            .scaleEffect(-0.8)
            .offset(x: -dim / 16, y: 0)
          
          Crescent()
            .fill(Color.tlouSecondary)
            .frame(width: proxy.size.width * 0.4, height: proxy.size.height * 0.3)
            .scaleEffect(-0.5)
            .offset(x: dim / 8, y: 0)
          
        case POIMarkerType.objectInteract:
          Arrowhead(
            midPoint: CGPoint(x: 0.5, y: 0.7)
          )
            .fill(Color.tlouSecondary)
            .rotationEffect(Angle(degrees: 180))
            .frame(width: proxy.size.width * 0.3, height: proxy.size.width * 0.5)
            .offset(x: 0, y: 0)
          
        default:
          Circle().frame(width: .infinity, height: .infinity)
            .overlay(
              Text("ERROR\r\n Unknown POI Marker")
                .foregroundColor(.white)
                .italic()
            )
            .padding()
        }
        
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
    
  }
  
  var body: some View {
    let inset: CGFloat = 0.8
    GeometryReader { proxy in
      ZStack {
        Teardrop()
          .rotation(Angle(radians: .pi))
          .blur(radius: 5.0)
          .frame(width: proxy.size.width, height: proxy.size.height)
        
        Teardrop()
          .rotation(Angle(radians: .pi))
          .stroke(Color.tlouSecondary, lineWidth: 5)
          .frame(width: proxy.size.width * inset, height: proxy.size.height * inset)
        view(for: markerType)
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct DialogueMarker_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.blue
      POIMarker(markerType: POIMarkerType.dialogue)
    }
    .frame(width: 100, height: 180)
    .previewLayout(.sizeThatFits)
  }
}
