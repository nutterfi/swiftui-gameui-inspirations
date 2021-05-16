//
//  TLOUSkillSelectMenu.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/11/21.
//

import SwiftUI

struct TLOUSkillSelectMenu: View {
  @StateObject var viewModel = TLOUSkillSelectMenuViewModel()
  @State private var selectedSkillID: String = ""
    var body: some View {
      
      VStack {
        HStack {
          Text("SKILLS")
            .font(.largeTitle)
          Spacer()
          SkillVitamin(color: .tlouSecondary)
            .frame(width: 50)
          Text("\(viewModel.points)")
            .font(.largeTitle)
        }
        .foregroundColor(.tlouSecondary)
        .frame(height: 100)
        .padding()
        List {
          ForEach(viewModel.skills) { skill in
            SkillSelectionRow(selected: selectedSkillID == skill.id, points: skill.nextLevelCost, title: viewModel.title(for: skill.id), icon: skill.id, skillLevelsAvailable: skill.levelsAvailable, currentSkillLevel: skill.currentLevel, enoughPoints: viewModel.points >= skill.nextLevelCost)
              .frame(height: 80)
              .onTapGesture {
                selectedSkillID = skill.id
              }
          }
          .listRowBackground(Color.black)
        }
        .background(Color.black)
        .frame(height: 300)
        
        Button("UPGRADE") {
          viewModel.purchase(skillID: selectedSkillID)
        }
        .foregroundColor(.tlouSecondary)
        .font(.title2)
        
        Spacer()

      }
      .background(Color.black)
    }
}

struct TLOUSkillSelectMenu_Previews: PreviewProvider {
    static var previews: some View {
      TLOUSkillSelectMenu()
        .previewDevice("iPhone 12 Pro Max")
          .background(Color.black)
    }
}
