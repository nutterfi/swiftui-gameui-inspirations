//
//  SpiderManSkillTree.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 12/2/21.
//

import SwiftUI
import Shapes

struct SpiderManSkillToolTip: View {
  var skill: SpiderManSkill
  var body: some View {
    VStack(alignment: .leading) {
      Text(skill.name)
      Image(systemName: "ant")
        .resizable()
        .frame(width: .infinity, height: 150)
        .border(.white)
      HStack(alignment: .top) {
        RightTriangle()
          .scale(x: -1)
          .foregroundColor(.red)
          .frame(width: 10, height: 10)
        Text(skill.description)
      }
      HStack {
        Image(systemName: "person")
        Text("COST")
        Spacer()
        ZStack(alignment: .trailing) {
          Trapezoid(pct1: 0.25, pct2: 1.0)
            .foregroundColor(.black)
            .frame(width: 30, height: 10)
          Text("1")
            .foregroundColor(.white)
        }
        .padding()
      }
      .border(.white)
      HStack {
        Image(systemName: "checkmark.square")
          .foregroundColor(.green)
        Text("LEVEL 3")
      }
      Spacer()
    }
    .background(Color.spiderManTeal)
    .foregroundColor(.white)
  }
}

struct SpiderManSkillTree: View {
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        let skillViewFrame = 0.1 * dim
//        var skillPositions: [CGPoint]?
        Color.spiderManTeal
          .frame(width: 3, height: dim * 0.25)
          .offset(x: 0, y: -dim * 0.125)
        // baseline skill (Tier 1)
        
        SpiderManSkillView(skill: SpiderManSkill(type: .venom, state: .unlocked, name: "Venom Jump", description: "Pressing L1 + X launches nearby enemies into the air, disarming and Venom Stunning them."))
          .frame(width: skillViewFrame, height: skillViewFrame)

        
        // Tier 2 skills
        SpiderManSkillView(skill: SpiderManSkill(type: .venom, state: .locked, name: "Name", description: ""))
          .frame(width: skillViewFrame, height: skillViewFrame)
          .offset(x: 0, y: -dim * 0.2)
        
        SpiderManSkillView(skill: SpiderManSkill(type: .venom, state: .locked, name: "Name", description: ""))
          .frame(width: skillViewFrame, height: skillViewFrame)
          .offset(x: -dim * 0.15, y: -dim * 0.15)
        
        SpiderManSkillView(skill: SpiderManSkill(type: .venom, state: .locked, name: "Name", description: ""))
          .frame(width: skillViewFrame, height: skillViewFrame)
          .offset(x: dim * 0.15, y: -dim * 0.15)
        
        
        
        // Tier 3 skills
        SpiderManSkillView(skill: SpiderManSkill(type: .venom, state: .locked, name: "Name", description: ""))
          .frame(width: skillViewFrame, height: skillViewFrame)
          .offset(x: -dim * 0.15, y: -dim * 0.35)
        
        SpiderManSkillView(skill: SpiderManSkill(type: .venom, state: .locked, name: "Name", description: ""))
          .frame(width: skillViewFrame, height: skillViewFrame)
          .offset(x: dim * 0.15, y: -dim * 0.35)
        
        
        SpiderManSkillView(skill: SpiderManSkill(type: .venom, state: .locked, name: "Name", description: ""))
          .frame(width: skillViewFrame, height: skillViewFrame)
          .offset(x: 0, y: -dim * 0.4)
        
        // Tier 4 skills
        SpiderManSkillView(skill: SpiderManSkill(type: .venom, state: .locked, name: "Name", description: ""))
          .frame(width: skillViewFrame, height: skillViewFrame)
          .offset(x: 0, y: -dim * 0.6)
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct SpiderManSkillView: View {
  var skill: SpiderManSkill
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        ConvexPolygon(sides: 6)
        ConvexPolygon(sides: 6).stroke(Color.spiderManSkillBorder)
        Image(systemName: "ant.fill")
          .resizable()
          .scaledToFit()
          .frame(width: dim * 0.5, height: dim * 0.5)
          .foregroundColor(.white)
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

extension Color {
  static var spiderManTeal: Color {
    Color(red: 16/255, green: 59/255, blue: 79/255)
  }
  
  static var spiderManSkillBorder: Color {
    Color(red: 67/255, green: 108/255, blue: 118/255)
  }
}

// THIS IS TOP LEVEL VIEW
struct SpiderManSkillsMenu: View {
  var selectedSkill: SpiderManSkill
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        Color.black.ignoresSafeArea()
        SpiderManSkillsMap()
          .scaleEffect(1.3)
          .offset(x: -dim * 0.2, y: dim * 0.3)
        
        SpiderManSkillToolTip(skill: selectedSkill)
          .frame(width: proxy.size.width * 0.25, height: dim * 0.6)
          .offset(x: dim * 0.4, y: dim * 0.1)
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct SpiderManSkillsMap: View {
  let sides: Int = 13
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        let gradient = RadialGradient(colors: [.clear, .spiderManTeal], center: .center, startRadius: 0, endRadius: dim * 0.5)
        ZStack {
          ZStack {
            SpiderManWeb(sides: sides, controlPointRatio: 0.03)
              .fill(gradient)
            
            SpiderManWeb(sides: sides, controlPointRatio: 0.03)
              .stroke(Color.spiderManSkillBorder)

            SpiderManWeb(sides: sides, controlPointRatio: 0.03)
              .inset(by: dim * 0.1)
              .stroke(Color.spiderManSkillBorder)

            SpiderManWeb(sides: sides, controlPointRatio: 0.03)
              .inset(by: dim * 0.2)
              .stroke(Color.spiderManSkillBorder)

            SpiderManWeb(sides: sides, controlPointRatio: 0.03)
              .inset(by: dim * 0.3)
              .stroke(Color.spiderManSkillBorder)

            IsotoxalPolygon(sides: sides * 2, innerRadius: 0)
              .stroke(Color.spiderManSkillBorder, lineWidth: 3)

            SpiderManWeb(sides: sides, controlPointRatio: 0.03)
              .inset(by: dim * 0.4)
              .fill(Color.spiderManSkillBorder)

            SpiderManSkillTree()
              .foregroundColor(Color.spiderManTeal)
              .frame(width: dim * 0.5, height: dim * 0.5)
              .offset(x: 0, y: -dim * 0.15)
          }
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct SpiderManSkillTree_Previews: PreviewProvider {
  static var previews: some View {
    SpiderManSkillsMenu(selectedSkill: SpiderManSkill(type: .venom, state: .unlocked, name: "Venom Jump", description: "Pressing L1 + X launches nearby enemies into the air, disarming and Venom Stunning them."))
      .previewInterfaceOrientation(.landscapeLeft)
  }
}
