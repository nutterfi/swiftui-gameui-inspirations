//
//  GenshinImpactLoadingProgressBar.swift
//
//  Created by nutterfi on 2/15/21.
//

import SwiftUI

struct GenshinImpactLoadingProgressBar: View {
  @State var progress: Float = 0.0
  
    var body: some View {
      VStack {
        Slider(value: $progress)
          .padding()
        
        Spacer()
        
        MaskedProgressBar(progress: progress, backView: Color.gray, frontView: Color.blue, mask: mask)
          .frame(width: 200, height: 50)
        
        Spacer()
      }
      .padding()
    }
  
    var mask: some View {
      let names = ["flame", "drop", "wind", "bolt", "leaf", "snow", "camera.aperture"]
  
      return HStack {
        ForEach(names, id: \.self) { name in
          Image(systemName: name)
            .resizable()
            .scaledToFit()
        }
      }
    }
}

struct GenshinImpactLoadingProgressBar_Previews: PreviewProvider {
    static var previews: some View {
      GenshinImpactLoadingProgressBar()
    }
}
