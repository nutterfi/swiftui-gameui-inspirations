//
//  TLOUMenu.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 10/28/21.
//

import SwiftUI

struct TLOUMenuIdentifier {
  static let skillsMenu = "skillsMenu"
  static let poiMarkers = "poiMarkers"
  static let fireflyPendant = "fireflyPendant"
}

struct TLOUMenuItem: Identifiable {
  let id = UUID()
  let menuIdentifier: String
  var title: String
}

struct TLOUMenu: View {
  var items: [TLOUMenuItem] {
    [
      TLOUMenuItem(menuIdentifier: TLOUMenuIdentifier.skillsMenu, title: "skills menu"),
      TLOUMenuItem(menuIdentifier: TLOUMenuIdentifier.poiMarkers, title: "POI Markers"),
      TLOUMenuItem(menuIdentifier: TLOUMenuIdentifier.fireflyPendant, title: "Firefly Pendant")
    ]
  }
  
  let layout = Array(repeating: GridItem(), count: 2)
  
  func destination(for menuIdentifier: String) -> some View {
    return ZStack {
      switch menuIdentifier {
      case TLOUMenuIdentifier.poiMarkers:
        HStack {
          POIMarker(markerType: POIMarkerType.dialogue)
            .frame(width: 100, height: 200)
          POIMarker(markerType: POIMarkerType.objectInteract)
            .frame(width: 100, height: 200)
        }
      case TLOUMenuIdentifier.skillsMenu:
        TLOUSkillSelectMenu()
      case TLOUMenuIdentifier.fireflyPendant:
        FireflyPendant()
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
    GeometryReader { proxy in
      ZStack {
        
        LinearGradient(colors: [.black, .tlouSecondary], startPoint: .topLeading, endPoint: .bottomTrailing)
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
                        .font(.custom("AvenirNextCondensed-Medium", size: 32))
                        .shadow(color: Color.black, radius: 5, x: 1, y: 1)
                    }
                  }
                }
                .foregroundColor(.black)
              }
            }
          }
        }
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct TLOUMenu_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      TLOUMenu()
    }
  }
}
