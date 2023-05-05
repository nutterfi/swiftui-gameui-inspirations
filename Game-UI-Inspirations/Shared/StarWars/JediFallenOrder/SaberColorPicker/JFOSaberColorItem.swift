//
//  JFOSaberColorItem.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/4/23.
//

import SwiftUI

struct JFOSaberColorItem: View {
  var saberColor: Color = .blue
  var isSelected: Bool = false
  @State private var isAnimating: Bool = false
  
  var body: some View {
    ZStack {
      
      let rotation: CGFloat = saberColor ==  .green ? 45 : 55
      
      // Background color
      if isSelected {
        JFOSelectedItemDecoration()
          .rotationEffect(.degrees(isAnimating ? 360 : .zero))
          .animation(.linear(duration: 20).repeatForever(autoreverses: false), value: isAnimating)
          .onAppear {
            isAnimating = true
          }
          .onDisappear {
            isAnimating = false
          }
      }
      
      Circle()
        .stroke(Color.gray, lineWidth: 3)
        .shadow(color: .gray, radius: 5)
      
      Group {
        LinearGradient(colors: [saberColor, .white, saberColor], startPoint: .leading, endPoint: .trailing)
          .rotationEffect(.degrees(rotation))
        SaberHilt()
          .rotation(.degrees(rotation))
          .offset(x: 0, y: 10)
          .shadow(color: .white, radius: 2, x: 1)
      }
        .clipShape(Circle().inset(by: 3))
      

    }
    .frame(width: 84, height: 84)

  }
  
}

struct JFOSaberColorItem_Previews: PreviewProvider {
    static var previews: some View {
        JFOSaberColorItem()
    }
}
