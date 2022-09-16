//
//  FireflyPendant.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 4/24/21.
//

import SwiftUI

struct FireflyPendantDemo: View {
  @State private var rustLevel: CGFloat = 0.1

  var body: some View {
    VStack {
      Slider(value: $rustLevel)
      FireflyPendant(rustLevel: rustLevel, rustStyle: RustifierStyle.one)
      FireflyPendant(rustLevel: rustLevel, rustStyle: RustifierStyle.two)
      FireflyPendant(rustLevel: rustLevel, rustStyle: RustifierStyle.three)
    }
    .padding()
  }
  
}

struct FireflyPendant: View {
  var rustLevel: CGFloat = 0.1
  var rustStyle: String = RustifierStyle.one
  
  @State private var filter = CIFilter(name: "CICMYKHalftone")!
  
  func setupFilter() async {
    filter.setValue(0.5, forKey: "inputSharpness")
    filter.setValue(0.2, forKey: "inputGCR")
    filter.setValue(0.5, forKey: "inputUCR")
    filter.setValue(0.45, forKey: "inputAngle")
    filter.setValue(2, forKey: "inputWidth")
    
    let view = RadialGradient(colors: [.black, .white], center: .center, startRadius: 0, endRadius: 512)
      .frame(width: 512, height: 512)
    //      if let image = renderer.cgImage {
    //        self.image = CIImage(cgImage: image)
      
    guard let uiInputImage = await ImageRenderer(content: view).uiImage else { return }
    
    let ciInputImage = CIImage(image: uiInputImage)
    filter.setValue(ciInputImage, forKey: kCIInputImageKey)
//    guard let filteredImage = filter.outputImage else { return }
//
//    filter.setValue(filteredImage, forKey: "inputImage")
  }
  
  
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        Circle()
          .frame(width: dim * 0.99)
          .foregroundColor(.gray)
        Circle()
          .stroke(Color.black, lineWidth: 2)
          .frame(width: dim * 0.9)
        
        FireflySymbol()
          .frame(width: dim * 0.9)
        
        // pendant hole
        Circle()
          .fill(Color.black)
          .frame(width: dim * 0.07)
          .offset(x: 0, y: -dim * 0.35)
        
        CIFilterView(
          input: RadialGradient(colors: [.black, .white], center: .center, startRadius: 0, endRadius: dim / 2)
            .frame(width: dim, height: dim),
          filter: filter,
          outputSize: proxy.size
        )
        
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
      //        .rustify(blur: rustLevel * 100, style: rustStyle)
    }
    .task {
      await setupFilter()
    }
  }
}

struct FireflyPendant_Previews: PreviewProvider {
  static var previews: some View {
    FireflyPendantDemo()
  }
}
