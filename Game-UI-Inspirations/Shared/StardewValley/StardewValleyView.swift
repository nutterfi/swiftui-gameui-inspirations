//
//  StardewValleyView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/28/22.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins
import Shapes

struct StardewValleyView: View {
  @State private var context = CIContext()
  
  @State private var filter = CIFilter.pixellate()
  
  @State private var filteredImage: Image?

  var testView: some View {
    SpiderManMask()
  }
  
  var body: some View {
    VStack {
      if let filteredImage = filteredImage {
        filteredImage
          .resizable()
          .scaledToFit()
      }
    }
    .task {
      self.loadImage()
    }
  }
  
  func loadImage() {
    let uiimage = testView.uiimage(
      rect: CGRect(
        origin: .zero,
        size: CGSize(width: 50, height: 50)
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

struct StardewValleyView_Previews: PreviewProvider {
  static var previews: some View {
    StardewValleyView()
  }
}
