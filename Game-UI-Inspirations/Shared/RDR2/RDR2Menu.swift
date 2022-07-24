//
//  RDR2Menu.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 10/28/21.
//

import SwiftUI

struct RDR2MenuIdentifier {
  static let minimap = "minimap"
  static let awardView = "awardView"
  static let revolverAnimation = "revolverAnimation"
  static let confirmButton = "confirmButton"
}

struct RDR2MenuItem: Identifiable {
  let id = UUID()
  let menuIdentifier: String
  var title: String
}

struct RDR2Menu: View {
  var items: [RDR2MenuItem] {
    [
      RDR2MenuItem(menuIdentifier: RDR2MenuIdentifier.minimap, title: "RDR2 Minimap"),
      RDR2MenuItem(menuIdentifier: RDR2MenuIdentifier.awardView, title: "Award View"),
      RDR2MenuItem(menuIdentifier: RDR2MenuIdentifier.revolverAnimation, title: "loading revolver"),
      RDR2MenuItem(menuIdentifier: RDR2MenuIdentifier.confirmButton, title: "confirm button")
    ]
  }
  
  let layout = Array(repeating: GridItem(), count: 2)
  
  func destination(for menuIdentifier: String) -> some View {
    Group {
      switch menuIdentifier {
      case RDR2MenuIdentifier.awardView:
        RDR2AwardBadge(award: RDR2Award(id: UUID(), progress: 0.1, image: "lasso.sparkles", rank: RDR2Award.Rank.teal))
      case RDR2MenuIdentifier.minimap:
        RDR2MinimapDemo()
      case RDR2MenuIdentifier.revolverAnimation:
        RDR2RevolverLoadingView()
      case RDR2MenuIdentifier.confirmButton:
        RDR2ConfirmButtonDemo()
      default:
        Circle().frame(width: .infinity, height: .infinity)
          .overlay(
            Text("ERROR\r\n Unknown Menu Identifier")
              .foregroundColor(.white)
              .italic()
          )
          .padding()
      }
    }
    
  }
  
  var body: some View {
    ZStack {
      LinearGradient(colors: [Color("rdr2Bronze"), Color("rdr2Gold")], startPoint: .topLeading, endPoint: .bottomTrailing)
        .ignoresSafeArea()
      
      LinearGradient(colors: [.white, .black], startPoint: .bottom, endPoint: .top)
        .opacity(0.6)
        .ignoresSafeArea()
      
      ScrollView() {
        LazyVGrid(columns: layout) {
          ForEach(items) { item in
            NavigationLink(destination: destination(for: item.menuIdentifier)) {
              ZStack {
                Color.white
                let titleArray = item.title.components(separatedBy: .whitespacesAndNewlines)
                VStack {
                  ForEach(titleArray, id:\.self) { title in
                    Text(title.uppercased())
                      .font(.custom("AmericanTypewriter", size: 28))
                      .shadow(color: Color.black, radius: 5, x: 1, y: 1)
                      .foregroundColor(title.isEmpty ? .white : .black)
                  }
                }
              }
              .foregroundColor(.black)
            }
          }
        }
      }
    }
  }
}

struct RDR2Menu_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      RDR2Menu()
    }
  }
}
