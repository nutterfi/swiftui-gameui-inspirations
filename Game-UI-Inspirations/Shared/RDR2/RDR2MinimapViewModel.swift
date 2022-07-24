//
//  RDR2MinimapViewModel.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 3/13/21.
//

import SwiftUI

class RDR2MinimapViewModel: ObservableObject {
  @Published var rotation: Angle = .zero
  @Published var playerPosition: CGPoint = .zero
  @Published var isRidingHorse: Bool = false
  @Published var entities: [Entity] = []
  
  static var demo: RDR2MinimapViewModel {
    let viewModel = RDR2MinimapViewModel()
    viewModel.entities = [NPC(position: CGPoint(x: 30, y: 20), type: .enemy)]
    return viewModel
  }
  
}
