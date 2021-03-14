//
//  MinimapViewModel.swift
//  rdr2-map-overlay
//
//  Created by nutterfi on 3/13/21.
//

import SwiftUI

struct NPC {
  var position: CGPoint
  var type: NPC.Allegiance
}

struct POI {
  
}

extension NPC {
  enum Allegiance {
    case friendly
    case enemy
  }
}

class MinimapViewModel: ObservableObject {
  @Published var rotation: Angle = .zero
  @Published var playerPosition: CGPoint = .zero
  @Published var npcs: [NPC] = []
  @Published var pois: [Any] = []
  init() {
    
  }
}
