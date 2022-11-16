//
//  MirroredTextDemo.swift
//  Game-UI-Inspirations (iOS)
//
//  Created by nutterfi on 10/27/22.
//

import SwiftUI

struct MirroredTextDemo: View {
  @State private var xAxis: CGFloat = 1
  @State private var yAxis: CGFloat = 0
  @State private var zAxis: CGFloat = 0
  @State private var rotation: CGFloat = 0
  @State private var perspective: CGFloat = 1
  @State private var anchor: UnitPoint = .center
  @State private var anchorZ: CGFloat = 0

    var body: some View {
      VStack {
        SliderLabelView(value: $xAxis, label: "X", range: 0...1)
        SliderLabelView(value: $yAxis, label: "Y", range: 0...1)
        SliderLabelView(value: $zAxis, label: "Z", range: 0...1)
  
        SliderLabelView(value: $rotation, label: "Rotation", range: 0...360)
        
        SliderLabelView(value: $anchorZ, label: "AnchorZ", range: -360...360)
        
        SliderLabelView(value: $perspective, label: "Perspective", range: 0...1)
        
        MirroredText(
          text: "W",
          rotation: rotation,
          axis: (x: xAxis, y: yAxis, z: zAxis),
          fontSize: 120,
          anchorZ: anchorZ,
          perspective: perspective
        )
        
      }
    }
}

struct MirroredTextDemo_Previews: PreviewProvider {
    static var previews: some View {
        MirroredTextDemo()
    }
}
