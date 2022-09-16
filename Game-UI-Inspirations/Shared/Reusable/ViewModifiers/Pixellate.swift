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
      let uiInputImage: UIImage
      if #available(iOS 16.0, *) {
        guard let image = ImageRenderer(content: content).uiImage else { return }
        uiInputImage = image
      } else {
        
        uiInputImage = content.uiImage(
          rect: CGRect(
            origin: .zero,
            size: CGSize(width: 200, height: 200) // MAGIC NUMBERS?!
          )
        )
      }
      
      let ciInputImage = CIImage(image: uiInputImage)
      filter.setValue(ciInputImage, forKey: kCIInputImageKey)
      guard let filteredImage = filter.outputImage else { return }
      
      // make the image from the context
      if let cgFilteredImage = context.createCGImage(filteredImage, from: filteredImage.extent) {
        result = Image(uiImage: UIImage(cgImage: cgFilteredImage))
      }
    }
  }
}

extension View {
  func pixellate() -> some View {
    modifier(Pixellate())
  }
}

