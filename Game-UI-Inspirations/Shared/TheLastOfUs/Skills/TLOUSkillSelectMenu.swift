//
//  TLOUSkillSelectMenu.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/11/21.
//

import SwiftUI

struct TLOUSkillModel: Identifiable {
  var id: String
  var currentLevel: Int // starts at 0
  var pointCost: [Int]
  
  var nextLevelCost: Int {
    pointCost[currentLevel]
  }
  
  var levelsAvailable: Int {
    pointCost.count
  }
  
}

class TLOUSkillSelectMenuViewModel: ObservableObject {
  @Published private(set) var skills: [TLOUSkillModel] = []
  @Published var selectedIndex: Int = 0
  @Published private(set) var points: Int = 285
  
  init() {
    skills.append(TLOUSkillModel(id: SkillIconType.maximumHealth, currentLevel: 1, pointCost: [50, 100]))
      
    skills.append(TLOUSkillModel(id: SkillIconType.healingSpeed, currentLevel: 0, pointCost: [30, 60, 90]))
    
    skills.append(TLOUSkillModel(id: SkillIconType.weaponSway, currentLevel: 1, pointCost: [50, 100]))
  }
  
  func purchase(skillID: String) {
    guard let index = skills.firstIndex(where: {$0.id == skillID})
    else { return }
    guard skills[index].nextLevelCost <= points else { return }
    // check our skills and find the one that is being reference
    // check to see if we have sufficient points to purchase
    // if we do, update the skills current level (increasing by 1)
    // also, deduct the skill points cost from total
    // FIXME: array out of bounds errors abound! BEWARE
    points -= skills[index].nextLevelCost
    
    if skills[index].currentLevel < skills[index].levelsAvailable {
      skills[index].currentLevel += 1
    }
  }
  
}

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
        
        List(viewModel.skills) { skill in
          SkillSelectionRow(selected: selectedSkillID == skill.id, points: skill.nextLevelCost, title: skill.id, icon: skill.id, skillLevelsAvailable: skill.levelsAvailable, currentSkillLevel: skill.currentLevel, enoughPoints: viewModel.points >= skill.nextLevelCost)
            .background(Color.black)
            .onTapGesture {
              selectedSkillID = skill.id
            }
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
