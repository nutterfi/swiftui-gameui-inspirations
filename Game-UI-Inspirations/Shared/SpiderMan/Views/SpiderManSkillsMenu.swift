//
//  SpiderManSkillTree.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 12/2/21.
//


/**
 TODO
 Top-level view owns a selected SpiderManSkill
 this is passed down to its child views via Bindings
 as the selected skill changes from interacting with the skilltreeview, the tooltip should also update
 */

import SwiftUI
import Shapes

struct SpiderManSkillsMenu: View {
  @StateObject private var viewModel = SpiderManSkillViewModel()
  
  var selectedSkill: SpiderManSkill
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        Color.black.ignoresSafeArea()
        SpiderManSkillsMap(viewModel: viewModel)
          .frame(width: proxy.size.width * 0.75, height: proxy.size.height * 0.7)
          .offset(x: -dim * 0.1, y: dim * 0.01)
        
        SpiderManSkillDetailView(skill: selectedSkill)
          .frame(width: proxy.size.width * 0.25, height: proxy.size.height * 0.65)
          .offset(x: proxy.size.width * 0.35, y: -proxy.size.height * 0.1)
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct SpiderManSkillsMap: View {
  let sides: Int = 12
  @ObservedObject var viewModel: SpiderManSkillViewModel
  
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      
      ZStack {
        SpiderManSkillTreeWeb(sides: sides)
        
        SpiderManSkillTreeView(model: $viewModel.model)
          .foregroundColor(Color.spiderManTeal)
          .frame(width: dim * 0.5, height: dim * 0.6)
          .offset(x: 0, y: -dim * 0.17)
        
        SpiderManSkillTreeView(model: $viewModel.model)
          .foregroundColor(Color.spiderManTeal)
          .frame(width: dim * 0.5, height: dim * 0.6)
          .rotationEffect(.degrees(60))
          .offset(x: dim * 0.57, y: dim * 0.17)
        
        SpiderManSkillTreeView(model: $viewModel.model)
          .foregroundColor(Color.spiderManTeal)
          .frame(width: dim * 0.5, height: dim * 0.6)
          .rotationEffect(.degrees(-60))
          .offset(x: -dim * 0.57, y: dim * 0.17)
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct SpiderManSkillMenu_Previews: PreviewProvider {
  static var previews: some View {
    SpiderManSkillsMenu(selectedSkill: SpiderManSkill.sample)
      .previewInterfaceOrientation(.landscapeLeft)
  }
}
