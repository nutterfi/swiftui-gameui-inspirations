//
//  PersonProfile.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 10/19/21.
//

import SwiftUI
import Shapes

struct PersonProfile: View {
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack() {
          Egg(apexAngle: 90)
            .scaledToFit()
            .rotationEffect(.radians(.pi))
            .frame(width: dim * 0.5)
            .offset(x: 0, y: -dim * 0.1)
          
          VStack () {
            Spacer()
            RoundedCornerRectangle(cornerRadius: dim * 0.25, corners: [.topLeft, .topRight])
              .frame(width: dim, height: proxy.size.height * 0.3)
          }

        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct PersonProfile_Previews: PreviewProvider {
    static var previews: some View {
      Group {
        PersonProfile()
          .frame(width: 512, height: 128)
        
        PersonProfile()
          .frame(width: 256, height: 256)
        
        PersonProfile()
          .frame(width: 128, height: 150)
      }
      .previewLayout(.sizeThatFits)
      .border(Color.black)
    }
}
