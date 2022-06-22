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
      GridRow {
        LABardStigmaSkillView()
          .scaledToFit()
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
        LASecretDungeonFloorPatternDemo()
          .scaledToFit()
      }
      
      GridRow {
        LACardBack()
      }
      
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
