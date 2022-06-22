//
//  OriSkillWheel.swift
//  Game-UI-Inspirations (iOS)
//
//  Created by nutterfi on 6/16/22.
//

import SwiftUI
import Shapes

struct OriSkillWheel: View {
  var skills = OriSkill.allCases
  var lockedSkills: [OriSkill] = [.locked7, .locked8, .locked9, .locked10, .locked11]
  
  @State private var selectedSkill: OriSkill?
  @State private var showSkillDetail = false
  
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        let vertices = ConvexPolygon(sides: skills.count)
          .vertices(in: CGRect(x: 0, y: 0, width: dim, height: dim).insetBy(dx: dim * 0.11, dy: dim * 0.11))
        
        Circle()
          .inset(by: dim * 0.11)
          .stroke(Color.white, lineWidth: 10)
        
        ForEach(0..<vertices.count, id: \.self) { index in
          let vertex = vertices[index]
          backgroundView
            .frame(width: dim * 0.18, height: dim * 0.18)
            .scaleEffect(1.3)
            .offset(x: -dim * 0.5 + vertex.x, y: -dim * 0.5 + vertex.y)
        }
        
        ForEach(skills) { skill in
          let index = skills.firstIndex(of: skill) ?? 0
          let vertex = vertices[index]
          OriSkillView(skill: skill, locked: lockedSkills.contains(skill))
            .frame(width: dim * 0.18, height: dim * 0.18)
            .overlay(
              Group {
                if selectedSkill == skill {
                  selectionOverlay
                } else {
                  EmptyView()
                }
              }
            )
            
            .offset(x: -dim * 0.5 + vertex.x, y: -dim * 0.5 + vertex.y)
            .onTapGesture {
              selectedSkill = skill
              showSkillDetail = false
            }
            .onLongPressGesture {
              // Show a view that is dimissed when you tap it
              if selectedSkill == skill, !lockedSkills.contains(skill) {
                showSkillDetail.toggle()
              }
            }
            
        }
        
        Text(selectedSkill?.description ?? "")
          .font(.system(size: 60))
          .foregroundColor(.white)
        
        if showSkillDetail {
          skillDetail
            .frame(width: dim, height: dim * 0.3)
            .onTapGesture {
              showSkillDetail.toggle()
            }
        }
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
  
  var selectionOverlay: some View {
    Circle()
      .stroke(Color.white, lineWidth: 20)
      .shadow(color: Color.white, radius: 15)
      .shadow(color: Color.white, radius: 5)
  }
  
  var backgroundView: some View {
    IsotoxalPolygon(sides: 16, innerRadius: 0.5)
      .foregroundColor(.blue)
      .shadow(color: Color.blue, radius: 5)
      .shadow(color: Color.blue, radius: 5)
      .blur(radius: 15)
  }
  
  var skillDetail: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        Color.black.ignoresSafeArea()
        HStack(spacing: 20) {
          if let selectedSkill {
            OriSkillView(skill: selectedSkill)
              .frame(width: dim * 0.5, height: dim * 0.5)
            
            Text(selectedSkill.description)
              .foregroundColor(.white)
            
            Spacer()
          }
        }
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct OriSkillWheel_Previews: PreviewProvider {
  static var previews: some View {
    OriSkillWheel()
      .background(Color.gray)
  }
}
