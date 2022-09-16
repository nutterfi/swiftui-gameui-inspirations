//
//  CIFilterView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/28/22.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct CIFilterView<T: View>: View {
  var input: T
  var filter: CIFilter
  var outputSize: CGSize = .init(width: 150, height: 150)
  
  @State private var context = CIContext()
  @State private var result: Image?
  
  var body: some View {
    GeometryReader { proxy in
      ZStack {
        if let result {
          result
            .resizable()
            .scaledToFit()
        }
      }
      .task {
        await self.loadImage()
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
  
  func loadImage() async {
    let uiInputImage: UIImage
    
    if #available(iOS 16.0, *) {
      guard let image = await ImageRenderer(content: input).uiImage else { return }
      uiInputImage = image
    } else {
      uiInputImage = input.uiImage(
        rect: CGRect(
          origin: .zero,
          size: outputSize
        )
      )
    }
    
    let ciInputImage = CIImage(image: uiInputImage)
    filter.setValue(ciInputImage, forKey: kCIInputImageKey)
    guard let filteredImage = filter.outputImage else { return }
    
    // make the image from the context
    if let cgFilteredImage = context.createCGImage(filteredImage, from: filteredImage.extent) {
      result = Image(cgImage: cgFilteredImage)
    }
    
  }
}

struct CIFilterView_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      HStack {
        OverwatchIcon(primary: Color.blue, secondary: Color.white)
          .frame(width: 150, height: 150)
        CIFilterView(input: OverwatchIcon(primary: Color.blue, secondary: Color.white), filter: CIFilter.pixellate())
          .frame(width: 150, height: 150)
          .previewLayout(.sizeThatFits)
      }
      HStack {
        Spider()
          .frame(width: 150, height: 150)
        
        CIFilterView(input: Spider(),
                     filter: CIFilter.pointillize())
        .frame(width: 150, height: 150)
        .previewLayout(.sizeThatFits)
      }
    }
    .padding()
    .background(Color.red)
  }
}
