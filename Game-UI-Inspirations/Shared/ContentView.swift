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
    titles = [Games.mgsv, Games.control, Games.mk11, Games.rdr2, Games.genshinImpact, Games.overwatch, Games.swtor, Games.tlou, Games.hades].sorted()
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
        GenshinImpactLoadingProgressBar()
      case Games.tlou:
        TLOUSkillSelectMenu()
      case Games.overwatch:
        OWUltimateMeterDemo()
      case Games.mgsv:
        MGSVMissionTextDemo()
      case Games.swtor:
        SWTOREmpireLogo()
      case Games.hades:
        HadesBoonDemo()
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
      case Games.mk11:
        MK11SelectionView()
          .frame(height: 120)
      case Games.overwatch:
        OverwatchIcon(primary: Color.white, secondary: Color.orange)
          .padding(5)
          .background(Color.black)
          .frame(height: 100)

      default:
        Text(title)
        .font(.largeTitle)
        .frame(maxWidth: .infinity)
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
