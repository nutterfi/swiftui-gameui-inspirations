//
//  SpiderManSkillDetailView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 12/9/21.
//

import SwiftUI
import Shapes

struct SpiderManSkillDetailViewModel {
  var skillState: SpiderManSkillState
  
  var title: String {
    if skillState.availability == .hidden {
      return "UNKNOWN"
    } else {
      return skillState.skill.name.uppercased()
    }
  }
  
  var status: String {
    let value: String
    switch skillState.availability {
    case .unlocked:
      value = "Owned"
    case .locked:
      value = "Locked" // TODO: Show NOT PURCHASED when model supports
    case .hidden:
      value = "Locked"
    }
    return value.uppercased()
  }
  
  var costDescription: String {
    let value: String
    switch skillState.availability {
    case .unlocked:
      value = "Equipped"
    case .locked:
      value = "Locked" // TODO: Show NOT PURCHASED when model supports
    case .hidden:
      value = ""
    }
    return value.uppercased()
  }
  
  var cost: String {
    return "1" // :)
  }
  
  var availability: SpiderManSkillAvailability {
    skillState.availability
  }
}

struct SpiderManSkillDetailView: View {
  var viewModel: SpiderManSkillDetailViewModel
  
  var titleTextColor: Color {
    switch viewModel.availability {
    case .unlocked:
      return .spiderManSkillFillLocked
    case .locked:
      return .white
    case .hidden:
      return .gray
    }
  }
  
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        VStack(alignment: .leading, spacing: 0) {
          let color: Color = viewModel.availability == .unlocked ? .spiderManUnlockedIconFill : .white
          ZStack(alignment: .leading) {
            Color.spiderManSkillFillLocked
            Text(viewModel.title)
              .foregroundColor(titleTextColor)
              .padding(.horizontal, 8)
          }
          .border(Color.spiderManTeal)
          .frame(width: dim, height: dim * 0.15)

          // Placeholder for a video loading animation
          SpiderManSkillLoadingView()
            .frame(width: dim, height: dim * 0.45)
            .padding(.vertical)
            .border(.white)
          
          HStack(alignment: .top, spacing: 5) {
            RightTriangle()
              .scale(x: -1)
              .foregroundColor(.red)
              .frame(width: 10, height: 10)
              .offset(x:0, y: 8)
            Text(viewModel.skillState.skill.description)
              .multilineTextAlignment(.leading)
          }
          .padding(8)
          
          // Cost Bar
          HStack(spacing: 3) {
            Color.spiderManTeal
              .overlay(
                SpiderManMask(
                  lines: 7,
                  color: color,
                  lineColor: viewModel.availability == .unlocked ? .black : .gray
                )
                .frame(width: dim * 0.12, height: dim * 0.12)
              )
              .frame(width: dim * 0.2, height: dim * 0.15)
              .padding(.horizontal, 1)
           
            Text(viewModel.costDescription)
              .fontWeight(.bold)
              .foregroundColor(.spiderManTeal)
            
            Spacer()
            
            ZStack(alignment: .trailing) {
              Trapezoid(pct1: 0.2, pct2: 1.0)
                .foregroundColor(.black)
                .frame(width: dim * 0.3, height: dim * 0.08)
              Text(viewModel.cost)
                .foregroundColor(.white)
                .padding(.horizontal, 8)
            }
            .padding(.horizontal, 3)
          }
          .padding(2)
          .background(
            color
          )
          .opacity(viewModel.availability == .hidden ? 0.0 : 1.0)
          
          // Level requirements
          HStack {
            Image(systemName: "checkmark.square")
              .foregroundColor(.green)
            Text("LEVEL 3")
          }
          .padding(.horizontal, 8)

          Spacer()
          
          // Divider Lines and then....
          HStack {
          color
            .frame(width: dim * 0.67, height: dim * 0.01)
          color
            .frame(width: dim * 0.1, height: dim * 0.01)
          }
          
          HStack {
            IsoscelesTriangle()
              .frame(width: 0.04 * dim, height: 0.04 * dim)
              .rotationEffect(.degrees(90))
            
            Text(viewModel.status)
              .fontWeight(.bold)
          }
          .foregroundColor(viewModel.availability == .unlocked
                           ? Color.spiderManUnlockedIconFill
                           : Color.white)
          .padding(8)
        }
        .background(Color.spiderManTeal)
        .foregroundColor(.white)
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct SpiderManSkillToolTip_Previews: PreviewProvider {
  static var previews: some View {
    SpiderManSkillDetailView(
      viewModel: SpiderManSkillDetailViewModel(
        skillState: SpiderManSkillState.sample
      )
    )
      .frame(width: 256, height: 512)
      .previewLayout(.sizeThatFits)
  }
}

extension SpiderManSkillState {
  static var sample: SpiderManSkillState {
    let skill = SpiderManSkill.sample
    let requirements = SpiderManSkillRequirements(characterLevel: 5, tier: 2, requiredSkillIds: [], cost: 2)
    let availability = SpiderManSkillAvailability.locked
    return SpiderManSkillState(skill: skill, requirements: requirements, availability: availability)
  }
}
