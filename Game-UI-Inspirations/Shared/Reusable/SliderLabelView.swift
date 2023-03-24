//
//  SliderLabelView.swift
//
//  Created by nutterfi on 10/27/22.
//

import SwiftUI

struct SliderLabelView: View {
  @Binding var value: CGFloat
  var label: String = ""
  var range: ClosedRange<CGFloat> = 0...1
  
  var minimumValue: String {
    String(format: "%.02f", range.lowerBound)
  }
  
  var maximumValue: String {
    String(format: "%.02f", range.upperBound)
  }
  
  var body: some View {
    VStack(spacing: 4) {
      HStack {
        Text(label)
        Spacer()
        Text(String(format: "%.02f", value))
          .monospacedDigit()
      }
      
      Slider(
        value: $value,
        in: range,
        minimumValueLabel: Text(minimumValue).font(.footnote),
        maximumValueLabel: Text(maximumValue).font(.footnote)
      ) {
        Text("whatever")
      }
     
    }
    .foregroundColor(.secondary)
  }
}
