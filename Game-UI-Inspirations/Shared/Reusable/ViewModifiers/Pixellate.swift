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
  @State private var filteredImage: Image?
  
  func body(content: Content) -> some View {
    AnyView(content)
      .overlay(
        VStack {
          if let filteredImage {
            filteredImage
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
      let uiimage = content.uiimage(
        rect: CGRect(
          origin: .zero,
          size: CGSize(width: 200, height: 200)
        )
      )
      let ciimage = CIImage(image: uiimage)
      filter.setValue(ciimage, forKey: kCIInputImageKey)
      guard let output = filter.outputImage else { return }
      
      // make the image from the context
      if let cgimage = context.createCGImage(output, from: output.extent) {
        filteredImage = Image(uiImage: UIImage(cgImage: cgimage))
      }
    }
  }
}

extension View {
  func pixellate() -> some View {
    modifier(Pixellate())
  }
}

