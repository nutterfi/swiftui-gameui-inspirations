//
//  SpiderManSkillDetailView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 12/9/21.
//

import SwiftUI
import Shapes

struct SpiderManSkillDetailView: View {
  var skillState: SpiderManSkill
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        VStack(alignment: .leading) {
          Text(skillState.name.uppercased())
            .padding(.horizontal, 8)

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
            Text(skillState.description)
              .multilineTextAlignment(.leading)
          }
          .padding(.horizontal, 8)
          
          HStack {
            // placeholder
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
          .padding(.horizontal, 8)
          .border(.white)
          HStack {
            Image(systemName: "checkmark.square")
              .foregroundColor(.green)
            Text("LEVEL 3")
          }
          .padding(.horizontal, 8)

          Spacer()
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
    SpiderManSkillDetailView(skillState: SpiderManSkill.sample)
      .frame(width: 256, height: 512)
      .previewLayout(.sizeThatFits)
    
  }
}
