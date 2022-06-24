//
//  MarqueeText.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 6/23/22.
//

import SwiftUI

// The animation is set to a duration
/**
  The animation duration determine the speed at which the text flies past the screen
 because it has to take into account the entire width of the text
 So a longer sentence will move faster for a set duration
 
 speed: number of characters per second
  speed = distance / time
   5.0 cps = [text.sizeThatFits + parent.width] / duration
    duration = [text.sizeThatFits + parent.width] / 5.0 cps
 */


struct MarqueeText: View {
  var text: String
  var speed: Double = 50.0 // character width per second
  var fontSize: Double = 40.0
  // character width is roughly 60% of the fontSize
  
  private var characterWidth: Double {
    fontSize * 0.52
  }
  
  private var animationDuration: Double {
    Double(text.count) * characterWidth / speed
  }
  
  @State private var animating = false
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      let width = Double(text.count) * characterWidth
      
      ZStack {
        Text(text)
          .font(.system(size: fontSize))
          .lineLimit(1)
          .fixedSize()
          .offset(x: animating ? -width / 2 : width / 2 , y: 0)
          .mask(Rectangle().frame(width: proxy.size.width, height: proxy.size.height))
        
          .animation(
            Animation.linear(duration: animationDuration)
              .repeatForever(autoreverses: false),
            value: animating)
          
      }
      .task {
        animating = true
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct MarqueeText_Previews: PreviewProvider {
  static var previews: some View {
    MarqueeText(text: longString)
      .frame(width: 200, height: 50)
      .padding()
      .border(Color.purple, width: 5)
  }
}

let longString = "Hello Chat! It's a beautiful day today and I'm so happy you're here :)"
