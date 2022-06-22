//
//  LAMenu.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 6/9/22.
//

import SwiftUI
import Shapes

struct LAMenu: View {
  var body: some View {
    Grid {
      Spacer()
      // TODO: More rigorous testing of composed views with different parent view content frames
      // probably need to use something different than GeometryReader
      GridRow {
        LABardStigmaSkillView()
          .scaledToFit()
          .background(Color.yellow)
        LostArkLogo()
          .scaledToFit()
          
        BreathGem(tier: Tier.one)
          .scaledToFit()
      }
      .padding()
      
      GridRow {
        LABossAttackAreaAnimation()
          .scaledToFit()
        PolygonSegmentWrapAnimation(sides: 8)
          .scaledToFit()
        LASecretDungeonFloorPattern()
          .scaledToFit()
      }

      Spacer()
      
    }
  }
}

struct LAMenu_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      LAMenu()
    }
  }
}
