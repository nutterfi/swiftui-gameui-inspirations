//
//  TextEffectView.swift
//  TextEffectView
//
//  Created by nutterfi on 8/17/21.
//

import SwiftUI

struct TextEffectView: View {
  @StateObject private var viewModel = TextEffectViewModel()
  
  private var timer: Timer?
  let columns = Array(repeating: GridItem(), count: 20)
    private var testString = "The quick brown fox jumped over the lazy dog and some other words to make this a very long paragraph because you never know how long your string will become"
    var body: some View {
      let test = testString.map{String($0)}
      
      VStack {
        Text("Number of sub strings: \(test.count)")
        
        LazyVGrid(columns: columns, spacing: 0) {
          ForEach(0..<test.count, id: \.self) { index in
            let yOffset: CGFloat =
            sin(2 * .pi * CGFloat(index) / 7 + CGFloat(viewModel.phase))
            Text(test[index])
              .offset(x: 4 * yOffset, y: 5 * yOffset)
              .foregroundColor(.black)
          }
        }
        .background(Color.red)
      }
    }
}

struct TextEffectView_Previews: PreviewProvider {
    static var previews: some View {
      TextEffectView()
        .previewDevice("iPhone 8")
    }
}
