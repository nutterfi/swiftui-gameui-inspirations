//
//  MaskedProgressBar.swift
//  MaskedProgressBar
//
//  Created by nutterfi on 2/15/21.
//

import SwiftUI

struct MaskedProgressBar<T: View, U: View, V: View>: View {
  var progress: Float
  var backView: T
  var frontView: U
  
  var mask: V

    var body: some View {
        ProgressBar(progress: progress, backView: backView, frontView: frontView)
          .mask(mask)
    }
}

struct MaskedProgressBar_Previews: PreviewProvider {
    static var previews: some View {
      MaskedProgressBar(progress: 0.5, backView: Color.yellow, frontView: Color.blue, mask: Capsule())
        .previewLayout(.sizeThatFits)
        .frame(width: 200, height: 100)
        .padding()
      
      MaskedProgressBar(progress: 0.4, backView: Color.yellow, frontView: Color.blue,
                        mask: HStack {
                            Text("Hello")
                            Circle()
                            Text("World")
                            Rectangle()
                          }
      )
        .previewLayout(.sizeThatFits)
        .frame(height: 100)
        .padding()
    }
}
