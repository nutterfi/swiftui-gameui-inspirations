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
    titles = [Games.mgsv, Games.control, Games.mk11, Games.rdr2, Games.genshinImpact, Games.overwatch, Games.swtor, Games.tlou, Games.hades, Games.detroit, Games.destiny2, Games.celeste].sorted()
  }
}

/*
 TODO:
 
Each item in this list to have its own unique flair for the game that we are about to peruse
 
 **/

struct ContentView: View {
  @StateObject private var viewModel = ContentViewModel()
  
  // TODO: Each game should have their own navigation list inside (e.g. Control we have multiple views so make a list in the style of each game)
  func destination(for title: String) -> some View {
    return ZStack {
      switch title {
      case Games.control:
        QuestDescriptionView()
      case Games.rdr2:
        MinimapDemo()
      case Games.mk11:
        KountdownTimerDemo()
      case Games.genshinImpact:
        GIInventoryMenu()
      case Games.tlou:
        TLOUSkillSelectMenu()
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
      default:
        Circle().frame(width: .infinity, height: .infinity)
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
    return ZStack {
      switch title {
      case Games.control:
        ControlSelectionView()
          .frame(height: 120)

      case Games.mk11:
        MK11SelectionView()
          .frame(height: 120)
      case Games.overwatch:
        OverwatchIcon(primary: Color.white, secondary: Color.orange)
          .padding(5)
          .background(Color.black)
          .frame(height: 120)
        
      case Games.swtor:
        SWTOREmpireLogo(color: Color.purple)
          .padding(5)
          .background(Color.black)
          .frame(height: 120)
      case Games.rdr2:
        RDR2ShowdownTitle(title: "RDR2")
          .frame(height: 120)
      case Games.genshinImpact:
        GIItemRarityBackground(rarity: .four)
          .frame(height: 120)
          .overlay(Text("Genshin Impact"))

      default:
        Text(title)
        .font(.largeTitle)
        .frame(maxWidth: .infinity, minHeight: 120)
        .foregroundColor(.white)
        .background(Color.blue)
      }
    }
  }
  
  var body: some View {
    NavigationView {
      List(viewModel.titles, id: \.self) { data in
        NavigationLink(destination: destination(for: data)) {
          selectionView(for: data)
        }
      }
      .navigationTitle("Games")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
.previewInterfaceOrientation(.portrait)
  }
}
