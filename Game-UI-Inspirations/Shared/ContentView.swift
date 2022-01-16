//
//  ContentView.swift
//  Shared
//
//  Created by nutterfi on 4/13/21.
//

import SwiftUI
import Shapes

class ContentViewModel: ObservableObject {
  @Published private(set) var titles: [String]
  init() {
    titles = Games.all.sorted()
  }
}

struct ContentView: View {
  @StateObject private var viewModel = ContentViewModel()
  
  func destination(for title: String) -> some View {
    return ZStack {
      switch title {
      case Games.control:
        QuestDescriptionView()
      case Games.rdr2:
        RDR2Menu()
      case Games.mk11:
        KountdownTimerDemo()
      case Games.genshinImpact:
        GIAchievementMenu()
      case Games.tlou:
        TLOUMenu()
      case Games.overwatch:
        OWUltimateMeterDemo()
      case Games.mgsv:
        MGSVMissionTextDemo()
      case Games.swtor:
        SWTOREmpireLogo(color: .purple)
      case Games.hades:
        HadesBoonDemo()
      case Games.detroit:
        DBHTitleScreenMenu()
      case Games.destiny2:
        Destiny2FastTravelView()
      case Games.celeste:
        CelesteDemo()
      case Games.spiderMan:
        SpiderManSkillsMenu(selectedSkill: SpiderManSkill.sample)
      case Games.persona5:
        Persona5AnimatedMenu()
      default:
        Circle()
          .frame(width: .infinity, height: .infinity)
          .overlay(
            Text("ERROR\r\n Unknown Game Title")
              .foregroundColor(.white)
              .italic()
          )
          .padding()
      }
    }
    
  }
  
  func selectionView(for title: String) -> some View {
    ZStack {
      switch title {
      case Games.control:
        ControlSelectionView()
      case Games.mk11:
        MK11SelectionView()
      case Games.overwatch:
        OverwatchIcon(primary: Color.white, secondary: Color.orange)
          .padding(5)
          .background(Color.black)
      case Games.swtor:
        SWTOREmpireLogo(color: Color.purple)
          .padding(5)
          .background(Color.black)
      case Games.rdr2:
        RDR2ShowdownTitle(title: "RDR2")
      case Games.genshinImpact:
        GIItemRarityBackground(rarity: .four)
          .overlay(
            Text("Genshin Impact")
              .font(.custom("GillSans", size: 24))
              .foregroundColor(.white)
          )
      case Games.tlou:
        TLOUMainMenuIcon()
      case Games.spiderMan:
        SpiderManMask()
          .background(LinearGradient(colors: [.blue, .black], startPoint: .topLeading, endPoint: .bottomTrailing))
      case Games.persona5:
        Persona5MenuItem(text: "Persona5")
          .background(Color.red)
        .frame(maxWidth: .infinity, minHeight: 120)
      default:
        Text(title)
        .font(.largeTitle)
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity, minHeight: 120)
        .foregroundColor(.white)
        .background(Color.blue)
      }
    }
    .frame(height: 120)
  }
  
  var body: some View {
    NavigationView {
      List(viewModel.titles, id: \.self) { title in
        NavigationLink(destination: destination(for: title)) {
          selectionView(for: title)
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .previewInterfaceOrientation(.portrait)
  }
}
