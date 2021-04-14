//
//  ProgressBar.swift
//  MaskedProgressBar
//
//  Created by nutterfi on 2/15/21.
//

import SwiftUI

struct ProgressBar<T: View, U: View>: View {
  var progress: Float
  var backView: T
  var frontView: U
  
    var body: some View {
      GeometryReader { gr in
        backView
          .overlay(
            frontView
              .frame(width: gr.size.width * CGFloat(progress))
            ,
            alignment: .leading
          )
      }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
      Group {
        ProgressBar(progress: 0.25, backView: Color.gray, frontView: Color.green)
          .previewLayout(.sizeThatFits)
          .frame(width: 200, height: 10)
        
        ProgressBar(progress: 0.65, backView: Color.red, frontView: LinearGradient(gradient: Gradient(colors: [.white, .yellow]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
          .previewLayout(.sizeThatFits)
          .frame(width: 100, height: 25)
      }
    }
}
