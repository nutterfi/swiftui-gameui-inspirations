//
//  FF7View.swift
//  Game-UI-Inspirations (iOS)
//
//  Created by nutterfi on 4/22/23.
//

import SwiftUI
import Shapes
extension Color {
  static let ff7Blue = Color(red: 110/255, green: 213/255, blue: 244/255)
  
  static let ff7DarkBlue = Color(red: 12/255, green: 40/255, blue: 87/255)
}

struct FF7View: View {
  var text: String
  @State private var shouldAnimate: Bool = false
  
  var marker: some View {
    GeometryReader { proxy in
      ZStack {
        Diamond().foregroundColor(.ff7DarkBlue)
          .overlay(
            Diamond() // Border
              .strokeBorder(style: .init(lineWidth: 2))
              .foregroundColor(.blue)
          )
        .frame(width: 24, height: 24)
        
        Diamond()
          .strokeBorder(style: .init(lineWidth: 2))
          .foregroundColor(.blue)
          .frame(width: 8, height: 8)
        
        Color.white
          .clipShape(Circle())
          .frame(width: 12, height: 12)
          .blur(radius: 2)
          .opacity(shouldAnimate ? 1.0 : 0.0)
          .animation(.easeInOut(duration: 1).repeatCount(2, autoreverses: true), value: shouldAnimate)
        
        Color.ff7Blue
          .frame(width: 1, height: proxy.size.height)
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
      
    }
    .onAppear {
      shouldAnimate = true
    }
    
  }
    var body: some View {
      ZStack(alignment: .top) {
        Color.ff7DarkBlue.frame(height: 1)
//          .overlay(
//            marker
//          )
        VStack(alignment: .leading) {
          HStack {
            marker
            Text(text)
              .foregroundColor(.white)
              .multilineTextAlignment(.leading)
              .frame(width: 200)
            Spacer()
          }
          .padding(.horizontal, 4)
          .background(Color.black.opacity(0.6))
        }
        
      }
      
    }
}

struct FF7View_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      FF7View(text: "Shinra's enemy is our enemy")
      FF7View(text: "The whole house started shaking. Just like that! The whole house started shaking. Just like that! The whole house started shaking. Just like that!")
      
      Color.clear
    }
    .previewLayout(.sizeThatFits)
    .background( Color.red )
    .frame(width: 300)
  }
    
}
