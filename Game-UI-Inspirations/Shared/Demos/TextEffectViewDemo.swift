//
//  TextEffectViewDemo.swift
//  TextEffectViewDemo
//
//  Created by nutterfi on 8/24/21.
//

import SwiftUI

struct TextEffectViewDemo: View {
  @State private var style = TextEffectView.TextOffsetStyle.none
  @State private var amplitude: CGFloat = 5.0
  
  
    var body: some View {
      GeometryReader { proxy in
        ZStack {
          VStack {
            Picker("", selection: $style) {
              Text("None").tag(TextEffectView.TextOffsetStyle.none)
              Text("Wave").tag(TextEffectView.TextOffsetStyle.wave)
              Text("Elevator").tag(TextEffectView.TextOffsetStyle.elevator)
              Text("Random").tag(TextEffectView.TextOffsetStyle.random)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            Slider(value: $amplitude, in: 0...10) {
              // NO-OP
            }
            .padding()
            
            TextEffectView(style: style, amplitude: amplitude, text: "The sign out front is busted... is this the Mountain trail?")
              .padding()
          }
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct TextEffectViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        TextEffectViewDemo()
    }
}
