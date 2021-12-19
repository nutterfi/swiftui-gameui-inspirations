//
//  SpiderManSkillTreeView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 12/9/21.
//

import SwiftUI

struct SpiderManSkillTreeView: View {
  @Binding var model: SpiderManSkillModel
  
  @StateObject private var progressModel = LongPressHoldModel()
  
  @State private var selectedSkill: SpiderManSkill?
  
  let lateralOffset = 0.3
    
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
  
  func overlay(with identifier: String) -> some View {
    Group {
        MaskedProgressBar(
          progress: identifier == selectedSkill?.id ? Float(progressModel.progress) : 0,
          backView: Color.clear,
          frontView: Color.yellow,
          mask: SpiderManSkillView(
            skill: model.skills["venom2"]! // FIXME: Unique identifiers man!
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
        
        // TODO: Unique Skills!
        ForEach(0..<points.count) { index in
          SpiderManSkillView(skill: model.skills["venom2"]!)
            .frame(width: skillViewFrame, height: skillViewFrame)
            .overlay(
              overlay(with: model.skills["venom2"]?.skill.id ?? "venom2")
            )
            .offset(x: points[index].x * dim, y: points[index].y * height)
            .longPressHoldable { state in
              switch state {
              case .inactive:
                progressModel.end()
              case .pressing:
                print("hold on for now")
              case .holding:
                progressModel.start()
              }
            }
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
    SpiderManSkillTreeView(model: .constant(SpiderManSkillModel.sample))
      .frame(width: 256, height: 256)
      .previewLayout(.sizeThatFits)
  }
}
