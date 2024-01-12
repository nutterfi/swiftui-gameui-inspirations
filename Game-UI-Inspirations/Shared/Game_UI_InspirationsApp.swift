//
//  Game_UI_InspirationsApp.swift
//  Shared
//
//  Created by nutterfi on 4/13/21.
//

import SwiftUI

// FIXME: iPad app does not look good! Most of the projects were built in an iPhone and it shows!
// Suggest: iPad landscape ONLY. iPhone landscape _may_ work if we fine-tune the navigation stack a bit, but otherwise

@main
struct Game_UI_InspirationsApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
  
  init() {
    UITableView.appearance().backgroundColor = .clear
    UITableViewCell.appearance().backgroundColor = .clear
  }
}
