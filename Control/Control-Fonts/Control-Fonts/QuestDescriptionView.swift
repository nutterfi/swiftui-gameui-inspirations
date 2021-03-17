//
//  QuestDescriptionView.swift
//  Control-Fonts
//
//  Created by nutterfi on 3/17/21.
//

import SwiftUI

/*
 Futura-Medium
 Futura-MediumItalic
 Futura-Bold
 Futura-CondensedMedium
 Futura-CondensedExtraBold
 */

extension Color {
  static var controlYellow: Color {
    Color(.sRGB, red: 1, green: 1, blue: 59.0/255, opacity: 1)
  }
}

struct QuestDescriptionView: View {
  var body: some View {
    ZStack {
      Color.black
        .ignoresSafeArea()
      
      VStack(alignment: .leading) {
        ZStack {
          Text("Control".uppercased())
            .font(.custom("Futura-Bold", size: 100))
            .kerning(-4)
            .foregroundColor(.white)
        }
        .frame(width: .infinity)
        
        Divider()
        
        HStack(alignment: .top, spacing: 20) {
          ZStack {
            Rectangle()
              .stroke(Color.controlYellow, lineWidth: 2)
              .frame(width: 15, height: 15)
            Color.controlYellow
              .frame(width: 8, height: 8)
          }
          .rotationEffect(.init(degrees: 45))
          .offset(x: 0, y: 5)
          
          VStack(alignment: .leading, spacing: 5) {
            Text("Threshold".uppercased())
              .foregroundColor(.controlYellow)
              .font(.custom("Futura-CondensedMedium", size: 20))
            Text("Search for Black Rock Processing")
              .foregroundColor(.white)
              .font(.custom("Futura-Bold", size: 16))
            Text("Maintenance / Central Maintenance".uppercased())
              .foregroundColor(.gray)
              .font(.custom("Futura-CondensedMedium", size: 14))
              .kerning(1)
            
          }
        }
        Spacer()
      }
      .padding()
      
    }
  }
}

struct QuestDescriptionView_Previews: PreviewProvider {
  static var previews: some View {
    QuestDescriptionView()
      .previewDevice("iPad (8th generation)")
  }
}
