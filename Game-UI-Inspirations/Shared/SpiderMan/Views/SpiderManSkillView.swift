//
//  SpiderManSkillView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 12/9/21.
//

import SwiftUI
import Shapes

/// visualization of a single skill 
struct SpiderManSkillView: View {
  var skill: SpiderManSkillState
  
  /// the background shape is determined by the skill type
  func sides(with type: SpiderManSkillType) -> Int {
    let sides: Int
    switch type {
    case .venom:
      sides = 6
    case .camoflauge:
      sides = 100
    case .combat:
      sides = 4
    }
    return sides
  }
  
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      let sides = sides(with: skill.skill.type)
      ZStack {
        ConvexPolygon(sides: sides)
          .fill(skill.availability == .unlocked ? Color.spiderManTeal : Color.spiderManSkillFillLocked)
        ConvexPolygon(sides: sides)
          .strokeBorder(Color.spiderManSkillBorder, lineWidth: max(2, dim * 0.02))
        
        Image(systemName: "lock.fill")
          .resizable()
          .scaledToFit()
          .frame(width: dim * 0.25, height: dim * 0.25)
          .foregroundColor(.gray)
          .opacity(skill.availability == .hidden ? 1.0 : 0.0)
        
        SpiderManMask(
          lines: 7,
          color: skill.availability == .unlocked ? .spiderManUnlockedIconFill : .black,
          lineColor: skill.availability == .unlocked ? .black : .gray
        )
          .frame(width: dim * 0.6, height: dim * 0.6)
          .opacity(skill.availability == .hidden ? 0.0 : 1.0)
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct SpiderManSkillView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      SpiderManSkillView(
        skill: SpiderManSkillState(
          skill: SpiderManSkill.sample,
          requirements: SpiderManSkillRequirements(
            characterLevel: 1,
            tier: 1,
            requiredSkillIds: [],
            cost: 1),
          availability: .locked
        )
      )

      SpiderManSkillView(
        skill: SpiderManSkillState(
          skill: SpiderManSkill(
            id: "",
            type: .combat,
            name: "Venom Jump",
            description: ""
          ),
          requirements: SpiderManSkillRequirements(
            characterLevel: 1,
            tier: 1,
            requiredSkillIds: [],
            cost: 1),
          availability: .hidden
        )
      )
                          
      SpiderManSkillView(
        skill: SpiderManSkillState(
          skill: SpiderManSkill(
            id: "",
            type: .camoflauge,
            name: "Venom Jump",
            description: ""
          ),
          requirements: SpiderManSkillRequirements(
            characterLevel: 1,
            tier: 1,
            requiredSkillIds: [],
            cost: 1),
          availability: .unlocked
        )
      )
    }
    .frame(width: 256, height: 256)
    .previewLayout(.sizeThatFits)
  }
}
