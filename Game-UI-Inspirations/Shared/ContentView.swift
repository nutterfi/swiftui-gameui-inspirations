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
    titles = ["MGSV", "Control", "MK11", "Genshin Impact", "RDR2", "The Last of Us", "Overwatch"]
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
      switch title.lowercased() {
      case "control":
        QuestDescriptionView()
      case "rdr2":
        RDR2AwardView()
      case "mk11":
        KountdownTimerDemo()
      case "genshin impact":
        GenshinImpactLoadingProgressBar()
      case "the last of us":
        TLOUSkillSelectMenu()
      case "overwatch":
        OverwatchLogoDemo()
      case "mgsv":
        MGSVMissionTextDemo()
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
      switch title.lowercased() {
      case "control":
        ControlSelectionView()
      case "mk11":
        MK11SelectionView()
          .frame(height: 120)
      case "overwatch":
        OverwatchIcon(primary: Color.white, secondary: Color.orange)
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
  }
}
