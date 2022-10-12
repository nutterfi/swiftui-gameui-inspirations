//
//  OW2UltimateMeter.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 10/11/21.
//

import SwiftUI
import Shapes

struct OW2UltimateMeterDemo: View {
  @State private var progress: Float = 0.25

  var body: some View {
    VStack {
      Slider(value: $progress)
      Button {
        progress = .zero
      } label: {
        Text("Ultimate Ready Toggle")
      }
      .disabled(progress != 1)
      .opacity(progress == 1 ?  1 : 0)

      Spacer()
      OW2UltimateMeter(progress: $progress)
        .padding()
    }
  }
}

struct OW2UltimateMeter: View {
  @Binding var progress: Float
  @State var isAnimating = false
  
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      
      // "headphones"
      let headphoneRotation: Double = ultimateReady ? .pi / 2 : 0
      
      ZStack {
        
        
          // Headphones
          Group {
            StrokeStyledCircle(
              numberOfSegments: 2,
              dashPattern: [2, 8],
              lineWidth: dim * 0.03,
              lineCap: .round
            )
              .rotation(.radians(-0.05 * 2 * .pi))
            
            Circle()
              .inset(by: dim * 0.02)
              .strokeBordered(5)
          }
          .foregroundColor(Color.ow2UltimateGray)
          .opacity(ultimateReady ? 1 : 0)
          .animation(.linear(duration: 0.5), value: ultimateReady)
        
        StrokeStyledCircle(numberOfSegments: 100, dashPattern: [1, 3], lineWidth: 2)
          .inset(by: ultimateReady ? dim * 0.08 : 0)
          .animation(.linear(duration: 0.5), value: ultimateReady)
          .foregroundColor(Color.ow2IconDarkGray)
        
        // Headphones
        Group {
          StrokeStyledCircle(
            numberOfSegments: 2,
            dashPattern: [2, 8],
            lineWidth: dim * 0.03,
            lineCap: .round
          )
            .inset(by: dim * 0.1)
            .rotation(.radians(-0.05 * 2 * .pi + headphoneRotation))
          
          Circle()
            .inset(by: dim * 0.12)
            .strokeBordered(5)
        }
        .foregroundColor(Color.ow2UltimateGray)
        
        
        // Meter
        
        Circle()
          .inset(by: dim * 0.18)
          .strokeBordered(dim * 0.08)
          .foregroundColor(Color.black.opacity(0.8))
        
        
        StrokeStyledCircle(numberOfSegments: 66, dashPattern: [4, 1], lineWidthRatio: 0.1, trim: (0, CGFloat(progress)))
          .inset(by: dim * 0.18)
          .rotationEffect(Angle.degrees(-90))

          .foregroundColor(.ow2Orange)
          .opacity(ultimateReady ? 0 : 1)
        
        // Inner Animated Circle
        StrokeStyledCircle(
          numberOfSegments: 2,
          dashPattern: [100, 5, 2, 5],
          lineWidth: 5,
          lineCap: .round
        )
        .inset(by: dim * 0.27)
        .rotation(.degrees(isAnimating ? 360 : 0))
        .animation(.linear(duration: 30).repeatForever(autoreverses: false), value: isAnimating)
        .foregroundColor(.ow2Orange)
        .opacity(ultimateReady ? 0 : 1)
        
        Image(systemName: "swift")
          .resizable()
          .scaledToFit()
          .foregroundColor(.black)
          .frame(width: dim * 0.5, height: dim * 0.5)
          .background(
            Circle()
              .foregroundColor(.white)
          )
          .opacity(ultimateReady ? 1 : 0)
        
        Group {
          Text("\(Int(progress*100))")
            .font(.custom("AvenirNextCondensed-MediumItalic", size: dim / 3))
            .kerning(0)
          
            .frame(maxWidth: .infinity)
        }
        .foregroundColor(Color.white)
        .opacity(ultimateReady ? 0 : 1)
      }
      .task {
        isAnimating.toggle()
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
  
  var ultimateReady: Bool {
    progress == 1
  }
}
// when all white background
// 255, 190, 154 outer ring
// 254, 221, 215 inner ring

// black background
// inner ring 188 89 38
// outer ring 246 120 36
struct OW2UltimateMeter_Previews: PreviewProvider {
  static var previews: some View {
    OW2UltimateMeterDemo()
      .background(Color.black)
  }
}
