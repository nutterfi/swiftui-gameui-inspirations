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
  @State private var filteredImage: Image?
  
  var body: some View {
    GeometryReader { proxy in
      ZStack {
        if let filteredImage = filteredImage {
          filteredImage
            .resizable()
            .scaledToFit()
        }
      }
      .task {
        self.loadImage()
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
  
  func loadImage() {
    let uiimage = input.uiimage(
      rect: CGRect(
        origin: .zero,
        size: outputSize
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
