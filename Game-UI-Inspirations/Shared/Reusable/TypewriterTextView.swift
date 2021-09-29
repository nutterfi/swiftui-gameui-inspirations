//
//  TypewriterTextView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 7/13/21.
//

import SwiftUI

struct TypewriterTextView<T: ShapeStyle>: View {
  var foreground: T
  var input: String
  
  @StateObject private var viewModel = TypewriterTextViewModel()
  var body: some View {
    GeometryReader { proxy in
      ZStack {
        HStack {
          Text(viewModel.text)
            .font(.largeTitle)
            .foregroundStyle(foreground)
          Spacer()
        }
        .padding()
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
    .onAppear {
      viewModel.input = input
      viewModel.start()
    }
  }
}

struct TypewriterTextView_Previews: PreviewProvider {
  static var previews: some View {
    TypewriterTextView(foreground: Color.purple, input: "Hello, World!")
  }
}
