//
//  SpiderManSkillTreeView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 12/9/21.
//

import SwiftUI

// TODO: Provide means to rotate skill tree while keeping icons facing 'straight up'
// warning: rotating this view will cause all the icons within to look strange
struct SpiderManSkillTreeView: View {
  @ObservedObject var viewModel: SpiderManSkillViewModel
  @StateObject private var progressModel = LongPressHoldModel()
  
  var skillType: SpiderManSkillType
    
  let lateralOffset = 0.3
  
  // relative positions of each skill view
  var points: [CGPoint] {
    [
      CGPoint(x: 0, y: 0.4), // tier 1
      CGPoint(x: 0, y: 0.13), // tier 2
      CGPoint(x: -lateralOffset, y: 0.19), // tier 2a
      CGPoint(x: lateralOffset, y: 0.19), // tier 2b
      CGPoint(x: 0, y: -0.13), // tier 3
      CGPoint(x: -lateralOffset, y: -0.08), // tier 3a
      CGPoint(x: lateralOffset, y: -0.08), // tier 3b
      CGPoint(x: 0, y: -0.4), // tier 4
    ]
  }
  
  var lineSegmentPairs: [(CGPoint, CGPoint)] {
    let points = points
    return [
      (points[0], points[1]),
      (points[1], points[2]),
      (points[1], points[3]),
      (points[1], points[4]),
      (points[4], points[5]),
      (points[4], points[6]),
      (points[4], points[7])
    ]
  }
  
  /// used to visualize long press and hold to unlock a skill
  ///  identifier needs to match the viewModel's selected skill to show progress in an overlay
  func overlay(with identifier: String) -> some View {
    Group {
        MaskedProgressBar(
          progress: identifier == viewModel.selectedSkillId ? Float(progressModel.progress) : 0,
          backView: Color.clear,
          frontView: Color.yellow,
          mask: SpiderManSkillView(
            skill:  viewModel.skillState(with: viewModel.selectedSkillId)!
          )
            .rotationEffect(.degrees(-90))
        )
        .rotationEffect(.degrees(-90))
        .animation(Animation.easeIn(duration: 0.2), value: progressModel.progress)
    }
  }
  
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      let height = proxy.size.height
      let skillViewFrame = 0.2 * dim
      ZStack {
        LineSegmentGroup(lineSegments: lineSegmentPairs)
          .stroke(Color.spiderManUnlockedIconFill, lineWidth: 3)
          .offset(x: proxy.size.width * 0.5, y: proxy.size.height * 0.5)
        
        let skillStates = viewModel.skillStates(skillType: skillType)
        
        ForEach(0..<skillStates.count) { index in
          let skillState = skillStates[index]
          let identifier = skillState.skill.id
          SpiderManSkillView(
            skill: skillState,
            selected: identifier == viewModel.selectedSkillId
          )
            .frame(width: skillViewFrame, height: skillViewFrame)
            .overlay(
              overlay(with: identifier)
            )
            .onTapGesture {
              viewModel.selectSkill(id: identifier)
            }
            .longPressHoldable { state in
              if identifier != viewModel.selectedSkillId {
                viewModel.selectSkill(id: identifier)
              }
              
              guard viewModel.isSkillUnlockable(id: identifier) else { return }
              
              
              switch state {
              case .inactive:
                if progressModel.unlocked {
                  viewModel.unlockSkill(id: identifier)
                }
                progressModel.end()
              case .pressing:
                print("hold on for now")
              case .holding:
                progressModel.start()
              }
            }
            .offset(x: points[index].x * dim, y: points[index].y * height)
        }
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

extension SpiderManSkillModel {
  static var sample: SpiderManSkillModel {
    var model = SpiderManSkillModel()
    model.buildTrees()
    return model
  }
}

struct SpiderManSkillTreeView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.black.ignoresSafeArea()
      Color.spiderManTeal.opacity(0.1).ignoresSafeArea()
      SpiderManSkillTreeView(viewModel: SpiderManSkillViewModel(), skillType: .combat)
    }
    .previewLayout(.sizeThatFits)
  }
}
