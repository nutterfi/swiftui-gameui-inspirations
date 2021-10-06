//
//  StarPolygonDemo.swift
//  StarPolygonDemo
//
//  Created by nutterfi on 8/31/21.
//

import SwiftUI
import Shapes

struct StarPolygonDemo: View {
  @State private var p: Float = 5
  @State private var q: Float = 2
  
  var body: some View {
    GeometryReader { proxy in
      ZStack {
        VStack {
          Text("points = \(Int(p))")
          Slider(value: $p, in: 3...20, step: 1) {
            Text("Hello World")
          } minimumValueLabel: {
            Text("3")
          } maximumValueLabel: {
            Text("20")
          } onEditingChanged: { _ in
            // FIXME: Dyamically update Max Q
            q = max(1, q)//min(q, Float(Int(p/2))))
          }
          
          Text("density = \(Int(q))")

          
          Slider(value: $q,
                 in: 1...10) //max(1, min(q, Float(Int(p/2)))))
                 {} minimumValueLabel: {
            Text("1")
          } maximumValueLabel: {
//            Text("\(Int(p/2))")
            Text("10")
          }
          
          StarPolygon(points: Int(p), density: Int(q))
            .stroke(.purple, lineWidth: 5)
          
          
          ZStack {
            ForEach(Array(0...Int(q)), id: \.self) { index in
              
              StarPolygon(points: Int(p), density: Int(index))
                .stroke(.purple, lineWidth: 1)
            }
          }
        }
        .padding()
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct StarPolygonDemo_Previews: PreviewProvider {
  static var previews: some View {
    StarPolygonDemo()
  }
}
