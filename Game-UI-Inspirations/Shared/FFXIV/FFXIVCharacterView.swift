//
//  FFXIVCharacterView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 7/6/21.
//

import SwiftUI
// TODO: GEometry Reader landscape dimensions?!
struct FFXIVCharacterView: View {
  
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
            HStack {
              Text("Character")
                .font(.title)
                .foregroundColor(.white)
              Spacer()
              Text("Nutter Fi".uppercased())
                .font(.title)
                .foregroundColor(.yellow)
            }
            Divider()
            
            HStack {
              VStack {
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
              .frame(width: dim * 0.5)
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
