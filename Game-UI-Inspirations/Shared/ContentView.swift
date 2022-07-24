//
//  ContentView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 4/13/21.
//

import SwiftUI
import Shapes

class ContentViewModel: ObservableObject {
  @Published private(set) var games: [Game]
  init() {
    games = Game.allCases.sorted(by: { g1, g2 in
      g1.rawValue < g2.rawValue
    })
  }
}

struct ContentView: View {
  @StateObject private var viewModel = ContentViewModel()
  @State var navigationPath = NavigationPath()
  
  var body: some View {
    NavigationStack(path: $navigationPath) {
      List(viewModel.games) { game in
        NavigationLink(destination: destination(for: game)) {
          selectionView(for: game)
        }
      }
    }
  }
  
  var unknownGameView: some View {
    let style = StrokeStyle(lineWidth: 20, lineJoin: .round, miterLimit: 0)
      
    return Reuleaux.triangle
      .strokeBorder(Color.purple, style: style)
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .overlay(
        Text("ERROR\r\n Unknown Game Title")
          .foregroundColor(.black)
          .italic()
      )
      .padding()
      .pixellate()

  }
  
  func defaultTitle(for game: Game) -> some View {
    Text(game.title)
      .font(.largeTitle)
      .multilineTextAlignment(.center)
      .frame(maxWidth: .infinity, minHeight: 120)
      .foregroundColor(.white)
      .background(Color.blue)
  }
  
  func destination(for game: Game) -> some View {
    Group {
      switch game {
      case .deathStranding:
        PorterGradeView()
      case .control:
        QuestDescriptionView()
      case .rdr2:
        RDR2Menu()
      case .mk11:
        KountdownTimerDemo()
      case .genshinImpact:
        GIAchievementMenu()
      case .tlou:
        TLOUMenu()
      case .overwatch:
        OWUltimateMeterDemo()
      case .mgsv:
        MGSVMissionTextDemo()
      case .swtor:
        SWTOREmpireLogo(color: .purple)
      case .hades:
        HadesBoonDemo()
      case .detroit:
        DBHTitleScreenMenu()
      case .destiny2:
        Destiny2FastTravelView()
      case .celeste:
        CelesteDemo()
      case .spiderMan:
        SpiderManSkillsMenu()
      case .persona5:
        Persona5AnimatedMenu()
      case .lostArk:
        LAMenu()
      case .stardewValley:
        CIFilterView(input: Spider(), filter: CIFilter.pointillize())
      case .ori:
        OriSkillTreeDemo()
      case .justCause4:
        JustCause4Demo()
      default:
        unknownGameView
      }
    }
    
  }
  
  func selectionView(for game: Game) -> some View {
    Group {
      switch game {
      case Game.deathStranding:
        DeathStrandingTitle()
      case Game.control:
        ControlSelectionView()
      case Game.mk11:
        MK11SelectionView()
      case Game.overwatch:
        OverwatchIcon(primary: Color.white, secondary: Color.orange)
          .padding(5)
          .background(Color.black)
      case Game.swtor:
        SWTOREmpireLogo(color: Color.purple)
          .padding(5)
          .background(Color.black)
      case Game.rdr2:
        RDR2ShowdownTitle(title: "RDR2")
      case Game.genshinImpact:
        GIItemRarityBackground(rarity: .four)
          .overlay(
            Text("Genshin Impact")
              .font(.custom("GillSans", size: 24))
              .foregroundColor(.white)
          )
      case Game.tlou:
        TLOUMainMenuIcon()
      case Game.spiderMan:
        SpiderManMask()
          .background(LinearGradient(colors: [.blue, .black], startPoint: .topLeading, endPoint: .bottomTrailing))
      case Game.persona5:
        Persona5MenuItem(text: "Persona5")
          .background(Color.red)
        .frame(maxWidth: .infinity, minHeight: 120)
      case Game.lostArk:
        LostArkSelectionView()
          .frame(maxWidth: .infinity, minHeight: 120)
      default:
        defaultTitle(for: game)
      }
    }
    .frame(height: 120)
  }
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .previewInterfaceOrientation(.landscapeLeft)
  }
}
