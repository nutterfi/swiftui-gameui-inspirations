//
//  SliderLabelView.swift
//
//  Created by nutterfi on 10/27/22.
//

import SwiftUI

struct SliderLabelView: View {
  @Binding var value: CGFloat
  var label: String = ""
  var range: ClosedRange<CGFloat>
  
  var minimumValue: String {
    String(format: "%.02f", range.lowerBound)
  }
  
  var maximumValue: String {
    String(format: "%.02f", range.upperBound)
  }
  
  var body: some View {
    VStack {
      Text(String(format: "%.02f", value))
        .monospacedDigit()
      HStack {
        Text(label)
        Slider(
          value: $value,
          in: range,
          minimumValueLabel: Text(minimumValue),
          maximumValueLabel: Text(maximumValue)
        ) {
          Text("whatever")
        }
      }
    }
  }
}
