//
//  ProgressBarWithDeltaDemo.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/26/22.
//

import SwiftUI
import Shapes
// WIP
struct ProgressBarWithDeltaDemo: View {
  @State private var delta: Float = 0.2
  @State private var progress: Float = 0.3
  
  let myBlue = Color(red: 111/255, green: 192/255, blue: 208/255)
  
  var body: some View {
    ZStack {
      Color.black.opacity(0.9).ignoresSafeArea()
      
      VStack {
        Slider(value: $delta)
          .padding()
        
        Button {
          delta += 0.1
        } label: {
          Text("Increase Delta")
        }
        
        let total = 100 * (progress + delta)
        let totalStr = String(format: "%.2f", total)
        ProgressBarWithDelta(
          progress: Double(progress),
          delta: Double(delta),//animating ? Double(delta) : 0,
          backView: Color.black,
          progressView:
            VStack(spacing: 0) {
              myBlue
              myBlue.opacity(0.3)
            }
          ,
          deltaView: VStack(spacing: 0) {
            Color.white
            Color.white.opacity(0.3)
          }
        )
        .overlay(
          LinearGradient(colors: [Color.black.opacity(0.6), Color.black.opacity(0.0), Color.black.opacity(0.6)], startPoint: .top, endPoint: .bottom)
        )
        .overlay(
          HStack(spacing: 0) {
            Group {
              // try moving outside group
              Text("\(totalStr)")
                .frame(width: 75)
                .multilineTextAlignment(.trailing)
                
              Text("% / ")
              
              Text("60.00%")
                .font(.title3)
                .foregroundColor(.yellow)
            }
            .font(.title3)
            .foregroundColor(.white)
            .shadow(color: .black, radius: 2, x: 1, y: 1)
            .shadow(color: .black, radius: 2, x: 1, y: 1)
            .shadow(color: .black, radius: 2, x: 1, y: 1)

          }
        )
        .frame(width: 350, height: 50)
        .animation(Animation.easeInOut(duration: 0.3), value: delta)
        .mask(
          TaperedRect(taper: 25)
        )
        .background(
          TaperedRect(taper: 25)
            .scale(1.051)
          )
        
        Spacer()
        
      }
    }
  }
}

struct ProgressBarWithDeltaDemo_Previews: PreviewProvider {
  static var previews: some View {
    ProgressBarWithDeltaDemo()
  }
}
