//
//  SpiderManSkillViewModel.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 12/7/21.
//

import Foundation
import Combine

class SpiderManSkillViewModel: ObservableObject {
  @Published var model: SpiderManSkillModel
  
  init() {
    model = SpiderManSkillModel()
    model.buildTrees()
  }
  
  var sections: Int {
    return 4
  }
  
  func numberOfRows(in section: Int) -> Int {
    return 1
  }
  
  func blob(at index: IndexPath) -> SpiderManSkillState {
    guard let blob = model.skills["venom2"] else { fatalError() }
    return blob
  }
  
  // TODO: Grab meaningful data from the model
  private func blob(with id: String) -> SpiderManSkillState? {
      return nil
  }
  
}

