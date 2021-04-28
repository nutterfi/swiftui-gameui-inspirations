//
//  TLOUIconDemo.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 4/23/21.
//

import SwiftUI

struct TLOUIconDemo: View {
  var body: some View {
    VStack {
      TLOUIcon()
        .frame(width: 100, height: 100)
      
      HStack {
        POIMarker(markerType: POIMarkerType.dialogue)
          .frame(width: 100, height: 200)
        POIMarker(markerType: POIMarkerType.objectInteract)
          .frame(width: 100, height: 200)
      }
      
      FireflyPendant()
        .frame(width: 150, height: 200)
    }
  }
}

struct TLOUIconDemo_Previews: PreviewProvider {
  static var previews: some View {
    TLOUIconDemo()
  }
}
