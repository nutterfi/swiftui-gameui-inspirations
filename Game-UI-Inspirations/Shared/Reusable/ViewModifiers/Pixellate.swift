//
//  Pixellate.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/28/22.
//

import SwiftUI

struct Pixellate: ViewModifier {
  @State private var context = CIContext()
  @State private var filter = CIFilter.pixellate()
  @State private var result: Image?
  
  func body(content: Content) -> some View {
    AnyView(content)
      .overlay(
        VStack {
          if let result {
            result
              .resizable()
              .scaledToFit()
          }
        }
      )
      .task {
        self.loadImage(content)
      }
    
  }
  
  func loadImage(_ content: Content) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
      let renderer = ImageRenderer(content: content)
      guard let image = renderer.cgImage else { return }

      let ciInputImage = CIImage(cgImage: image)
      filter.setValue(ciInputImage, forKey: kCIInputImageKey)
      guard let filteredImage = filter.outputImage else { return }
      
      // make the image from the context
      if let cgFilteredImage = context.createCGImage(filteredImage, from: filteredImage.extent) {
        result = Image(cgImage: cgFilteredImage)
      }
    }
  }
}

extension View {
  func pixellate() -> some View {
    modifier(Pixellate())
  }
}

