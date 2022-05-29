//
//  ProgressBarWithDelta.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/26/22.
//

import SwiftUI

// 1. delta is introduced
// 2. immediately recalculate progress to be original +/- delta
// 3. draw new progress and delta side-by-side
// 4. optionally animate delta growing or shrinking

struct ProgressBarWithDelta<T: View, U: View, V: View>: View {
  var progress: Double
  var delta: Double
  var backView: T
  var progressView: U
  var deltaView: V
  var body: some View {
    GeometryReader { proxy in
      
      let boundedProgress = min(max(0, progress), 1)
      let boundedDelta = 1 - boundedProgress
      
      backView
        .overlay(
          HStack(spacing: 0) {
            progressView
            .frame(width: proxy.size.width * CGFloat(boundedProgress))
            deltaView
              .frame(width: proxy.size.width * CGFloat(delta > boundedDelta ? boundedDelta : delta))
          }
          ,
          alignment: .leading
        )
    }
  }
}

struct ProgressBarWithDelta_Previews: PreviewProvider {
  static var previews: some View {
    ProgressBarWithDelta(
      progress: 2,
      delta: 0.15,
      backView: Color.gray,
      progressView: Color.yellow,
      deltaView: Color.orange
    )
      .previewLayout(.sizeThatFits)
      .frame(width: 350, height: 50)
  }
}
