//
//  TextEffectView.swift
//  TextEffectView
//
//  Created by nutterfi on 8/17/21.
//

import SwiftUI


struct TextEffectView: View {
  
  struct TextOffsetStyle {
    static let none = "none"
    static let wave = "wave"
    static let elevator = "elevator"
    static let random = "random"
  }
  
  var style: String
  var amplitude: CGFloat
  
  var text: String
  
  @StateObject private var viewModel = TextEffectViewModel()
  
  let columns = Array(repeating: GridItem(), count: 10)
  
  func offset(index: Int) -> (CGFloat, CGFloat) {
    switch style {
    case TextOffsetStyle.none:
      return (0.0, 0.0)
    case TextOffsetStyle.wave:
      return (0.0, amplitude * sin(2 * .pi * CGFloat(viewModel.value) + CGFloat(index)))
    case TextOffsetStyle.elevator:
      
      return (0.0, amplitude * sin(2 * .pi * CGFloat(viewModel.value)))
      
    case TextOffsetStyle.random:
      return (CGFloat.random(in: 0...amplitude), CGFloat.random(in: 0...amplitude))
    default:
      return (0.0, 0.0)
    }
  }
  
  var body: some View {
    let characters = text.map{String($0)}
    
    LazyVGrid(columns: columns, spacing: -10) {
      ForEach(0..<characters.count, id: \.self) { index in
        let offset: (CGFloat, CGFloat) =
        offset(index: index)
        
        Text(characters[index])
          .offset(x: offset.0, y: offset.1)
          .foregroundColor(.black)
      }
    }
    .onAppear {
      viewModel.start()
    }
  }
}

struct TextEffectView_Previews: PreviewProvider {
  static var previews: some View {

    TextEffectView(style: "none", amplitude: 1, text: "The quick brown fox jumped over the lazy dog and some other words to make this a very long paragraph because you never know how long your string will become")
      .previewDevice("iPhone 8")
  }
}
