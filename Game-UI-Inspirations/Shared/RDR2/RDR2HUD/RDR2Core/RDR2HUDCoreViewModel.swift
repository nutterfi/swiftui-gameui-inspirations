//
//  RDR2HUDCoreViewModel.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 11/9/21.
//

import Foundation

class RDR2HUDCoreViewModel: ObservableObject {
  @Published private(set) var healthCore: RDR2CoreModel
  @Published private(set) var staminaCore: RDR2CoreModel
  @Published private(set) var deadeyeCore: RDR2CoreModel
  
  init() {
    healthCore = RDR2CoreModel(coreLevel: 0.5, barLevel: 0.25, type: .health)
    staminaCore = RDR2CoreModel(coreLevel: 0.2, barLevel: 0.1, type: .stamina)
    deadeyeCore = RDR2CoreModel(coreLevel: 0.0, barLevel: 0.75, type: .deadeye)
  }
  
}
