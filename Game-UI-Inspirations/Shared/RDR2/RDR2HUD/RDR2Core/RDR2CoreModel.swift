//
//  RDR2CoreModel.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 11/9/21.
//

import Foundation

struct RDR2CoreModel {
  
  enum CoreType {
    case health
    case stamina
    case deadeye
  }

  var coreLevel: Float
  var barLevel: Float
  var type: CoreType
}

