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

struct QuestDescriptionView: View {
  var body: some View {
    ZStack {
      HStack(alignment: .top, spacing: 20) {
        ControlQuestMarker()
          .frame(width: 15, height: 15)
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
      .padding()
      
    }
    .background(Color.black)
  }
}

struct QuestDescriptionView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      QuestDescriptionView()
        .previewLayout(.sizeThatFits)
    }
  }
}
