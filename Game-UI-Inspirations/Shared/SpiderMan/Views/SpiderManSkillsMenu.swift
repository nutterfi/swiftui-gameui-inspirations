//
//  SpiderManSkillTree.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 12/2/21.
//

/*
 TODO
 1. Long-press to unlock skill results in progress view getting stuck - DONE
 2. Update all fields in the skill detail view when selected skill changes
 3. Gyroscope effect on rotating skill trees so that icons always face up
 4. Layout fixes so that detail view does not obscure skills underneath
 5. Provide more detail in skill descriptions with help of JSON files
 6. Overall state updates (skill unlocked should update view and skill points remaining
 - Only allow locked skills to respond to long-press-and-hold gesture - DONE
 - reduce model to single source of truth to fix UI bugs - DONE
 - Check skill points remaining
 - Long-press should update selected skill - DONE
 
 ??. What the freak is happening with NavigationView?!
 
 */

import SwiftUI
import Shapes

struct SpiderManSkillsMenu: View {
  @StateObject private var viewModel = SpiderManSkillViewModel()
  
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        Color.black.ignoresSafeArea()
        SpiderManSkillsMap(viewModel: viewModel)
          .frame(width: proxy.size.width * 0.75, height: proxy.size.height * 0.7)
          .offset(x: -dim * 0.1, y: dim * 0.01)
        let selectedSkill = viewModel.skillState(with: viewModel.selectedSkillId)?.skill ?? SpiderManSkill.sample
        SpiderManSkillDetailView(skillState: selectedSkill)
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
        
        SpiderManSkillTreeView(viewModel: viewModel, skillType: .venom)
          .foregroundColor(Color.spiderManTeal)
          .frame(width: dim * 0.5, height: dim * 0.6)
          .offset(x: 0, y: -dim * 0.17)
        
        SpiderManSkillTreeView(viewModel: viewModel, skillType: .camoflauge)
          .foregroundColor(Color.spiderManTeal)
          .frame(width: dim * 0.5, height: dim * 0.6)
          .rotationEffect(.degrees(60))
          .offset(x: dim * 0.57, y: dim * 0.17)
        
        SpiderManSkillTreeView(viewModel: viewModel, skillType: .combat)
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
      SpiderManSkillsMenu()
        .previewInterfaceOrientation(.landscapeLeft)
  }
}
