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
  
  let items = Array(repeating: GridItem(), count: 3)
  
  var body: some View {
    NavigationStack(path: $navigationPath) {
      ScrollView {
        LazyVGrid(columns: items) {
          ForEach(viewModel.games) { game in
            NavigationLink(destination: destination(for: game)) {
              selectionView(for: game)
                .frame(height: 128)
            }
          }
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
  
  func defaultTitle(for game: Game, color: Color = .blue, textColor: Color = .white) -> some View {
    ZStack {
      color.ignoresSafeArea()
      Text(game.title)
        .font(.title)
        .multilineTextAlignment(.center)
        .foregroundColor(textColor)
    }
  
  }
  
  func destination(for game: Game) -> some View {
    Group {
      switch game {
      case .arkhamAsylum:
        ArkhamInterviewCollectionView()
      case .alanwake:
        AlanWakeSelectionView()
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
      case .overwatch2:
        OW2FindingGameAnimation()
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
      case .gotg:
        FactionBanner()
          .frame(height: 128)
      case .massEffect:
        MEDecryptionMinigame()
      case .diablo4:
          D4Waypoint()
      default:
        unknownGameView
      }
    }
    
  }
  
  func selectionView(for game: Game) -> some View {
    Group {
      switch game {
        case .arkhamAsylum:
          BatmanSelectionView()
        case .deathStranding:
          DeathStrandingTitle()
            .foregroundColor(.black)
        case .control:
          ControlSelectionView()
        case .mk11:
          MK11SelectionView()
        case .overwatch:
          OverwatchIcon(primary: Color.white, secondary: Color.orange)
            .padding(5)
            .background(Color.black)
        case .overwatch2:
          OW2SelectionView()
        case .swtor:
          SWTOREmpireLogo(color: Color.purple)
            .padding(5)
            .background(Color.black)
        case .rdr2:
          RDR2ShowdownTitle(title: "RDR2")
        case .genshinImpact:
          GIItemRarityBackground(rarity: .four)
            .overlay(
              Text("Genshin Impact")
                .font(.custom("GillSans", size: 24))
                .foregroundColor(.white)
            )
        case .tlou:
          TLOUMainMenuIcon()
        case .spiderMan:
          SpiderManMask()
            .background(LinearGradient(colors: [.blue, .black], startPoint: .topLeading, endPoint: .bottomTrailing))
        case .persona5:
          Persona5MenuItem(text: "Persona5")
            .background(Color.red)
        case .lostArk:
          LostArkSelectionView()
        case .gotg:
          ZStack {
            Color.purple.opacity(0.3)
            KreeSymbol()
              .foregroundColor(.black)
          }
        case .diablo4:
          defaultTitle(for: .diablo4, color: .black, textColor: .red)
          
        default:
          defaultTitle(for: game)
      }
    }
  }
  
}

#Preview {
    ContentView()
}
