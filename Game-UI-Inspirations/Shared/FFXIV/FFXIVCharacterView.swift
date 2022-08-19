//
//  FFXIVCharacterView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 7/6/21.
//

import SwiftUI
import Shapes

// TODO: Geometry Reader landscape dimensions?!
struct FFXIVCharacterView: View {
  @StateObject var model = FFXIVCharacterModel()
  @State var title = "Character"
  
  // reusable placeholder
  func equippedIcon(image: String) -> some View {
    RoundedRectangle(cornerRadius: 10)
      .frame(width: 72, height: 72)
      .overlay(
        Image(systemName: image)
          .resizable()
          .scaledToFit()
          .padding(5)
          .foregroundColor(.tlouYellow)
      )
  }
  
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack(alignment: .topLeading) {
        VStack {
          FFXIVWindowHeaderView(title: $title, description: $model.name)
          
          Divider()
          
          HStack(spacing: 20) {
            FFXIVCharacterTabView(title: .constant("Attributes"), selected: .constant(true))
            
            FFXIVCharacterTabView(title: .constant("Profile"), selected: .constant(false))
            
            FFXIVCharacterTabView(title: .constant("Classes/Jobs"), selected: .constant(false))
          }
          .frame(width: 800, height: 40)
          
          
          HStack {
            VStack {
              
              HStack(spacing: 50) {
                FFXIVCharacterPointsView(
                  totalPoints: .constant(178),
                  actualPoints: .constant(178),
                  color: .green,
                  title: "HP"
                )
                .frame(width: 175)
                FFXIVCharacterPointsView(
                  totalPoints: .constant(10000),
                  actualPoints: .constant(10000),
                  color: .pink,
                  title: "MP"
                )
                .frame(width: 175)
              }
              .frame(maxWidth: .infinity)
              .foregroundColor(.white)
              .padding()
              .background(
                RoundedRectangle(cornerRadius: 6)
                  .foregroundColor(Color.black.opacity(0.8))
              )
              
              
              
              Color.red
            }
            
            // character image and clothing
            VStack(alignment: .leading, spacing: 15) {
              // recommended gear
              RoundedRectangle(cornerRadius: 10)
                .frame(width: 64, height: 64)
                .overlay(
                  Image(systemName: "play")
                    .resizable()
                    .scaledToFit()
                    .padding(5)
                    .foregroundColor(.white)
                )
              
              // weapon, level and 'job'
              HStack {
                Color.blue  //rarity?
                  .frame(width: 5, height: 64)
                
                equippedIcon(image: "swift")
                
                VStack(alignment:.leading) {
                  Text("Level 11".uppercased())
                    .font(.title)
                    .foregroundColor(Color.hadesZeusYellow)
                  HStack {
                    Image(systemName: "line.3.crossed.swirl.circle")
                      .resizable()
                      .scaledToFit()
                      .frame(width: 48, height: 48)
                    
                    Text("Thaumaturge".uppercased())  // JOB
                      .font(.largeTitle)
                      .foregroundColor(Color.tlouSecondary)
                  }
                }
                Spacer()
              }
              .padding(5)
              .frame(maxWidth: .infinity)
              .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.black.opacity(0.3)))
              
              HStack(alignment: .top) {
                VStack {
                  equippedIcon(image: "swift")
                  equippedIcon(image: "swift")
                  equippedIcon(image: "swift")
                  equippedIcon(image: "swift")
                  equippedIcon(image: "swift")
                  equippedIcon(image: "swift")
                }
                // character render
                VStack {
                  RoundedRectangle(cornerRadius: 5)
                  
                }
                VStack {
                  equippedIcon(image: "swift")
                  equippedIcon(image: "swift")
                  equippedIcon(image: "swift")
                  equippedIcon(image: "swift")
                  equippedIcon(image: "swift")
                  equippedIcon(image: "swift")
                  equippedIcon(image: "swift")
                }
              }
              
              Spacer()
            }
            .padding()
//            .frame(width: dim * 0.5)
          }
          
          Spacer()
        }
        .padding()
        
      }
      .background(Color.gray)
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct FFXIVCharacterView_Previews: PreviewProvider {
  static var previews: some View {    
    FFXIVCharacterView()
      .previewInterfaceOrientation(.landscapeLeft)
      .previewDevice("iPad Pro (12.9-inch) (5th generation)")
  }
}
