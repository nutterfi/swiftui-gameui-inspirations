//
//  OverwatchLogoDemo.swift
//  Game-UI-Inspirations (iOS)
//
//  Created by nutterfi on 6/29/21.
//

import SwiftUI

struct OverwatchLogoDemo: View {
    var body: some View {
      VStack {
        OverwatchIcon(primary: .white, secondary: .orange)
        
        let gradient = LinearGradient(colors: [.tlouYellow, .purple], startPoint: .top, endPoint: .bottom)
        
        OverwatchIcon(primary: gradient, secondary: gradient)
        
        HStack {
          OverwatchIcon(primary: Color.tlouYellow, secondary: Color.tlouYellow)
          OverwatchIcon(primary: .blue, secondary: .orange)
          OverwatchIcon(primary: .image(Image(systemName: "gear")) , secondary: .orange)
        }
        .padding()
        
      }
      .padding()
      .background(Color.black)
    }
}

struct OverwatchLogoDemo_Previews: PreviewProvider {
    static var previews: some View {
        OverwatchLogoDemo()
    }
}
