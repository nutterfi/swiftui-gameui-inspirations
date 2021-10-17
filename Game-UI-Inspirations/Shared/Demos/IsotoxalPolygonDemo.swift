//
//  IsotoxalPolygonDemo.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 10/16/21.
//

import SwiftUI
import Shapes

struct IsotoxalPolygonDemo: View {
  @State private var sides: Float = 10
  @State private var innerRadius: Float = 0.6
  @State private var isAnimating: Bool = false
  
    var body: some View {
      ZStack {
        VStack {
          Text("sides = \(sides)")
          Slider(value: $sides, in: 2...20, step: 2) {
            Text("Hello World")
          } minimumValueLabel: {
            Text("2")
          } maximumValueLabel: {
            Text("20")
          }
          
          Text("innerRadius = \(innerRadius)")

          
          Slider(value: $innerRadius,
                 in: 0.0...1.5, step: 0.1)
                 {} minimumValueLabel: {
            Text("0.0")
          } maximumValueLabel: {
            Text("1.5")
          }
          
          IsotoxalPolygon(sides: Int(sides), innerRadius: CGFloat(innerRadius))
            .stroke(.purple, lineWidth: 5)
          
          IsotoxalPolygon(sides: Int(sides), innerRadius: isAnimating ? 1.0 : CGFloat(innerRadius))
            .stroke(.purple, lineWidth: 5)
            .animation(Animation.linear(duration: 1).repeatForever(), value: isAnimating)
            .onChange(of: innerRadius) { _ in
              isAnimating.toggle()
            }
            
        }
        .padding()
        .onAppear {
          isAnimating.toggle()
      }
      }
    }
}

struct IsotoxalPolygonDemo_Previews: PreviewProvider {
    static var previews: some View {
        IsotoxalPolygonDemo()
    }
}
