//
//  ContentView.swift
//  rdr2 image filter
//
//  Created by nutterfi on 1/23/21.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct RDR2Splash: View {
  let context = CIContext()
  @State private var sepia = CIFilter.sepiaTone()
  @State private var colorInvert  = CIFilter.colorInvert()
  
  @State private var inputImage: UIImage?
  
  @State private var sepiaImage: Image?
  @State private var colorInvertedImage: Image?
  
  @State private var maskSize: CGFloat = 2000
  
  // Total Blur
  @State private var shouldBlur: Bool = true
  @State private var visible: Bool = false
  
  var funnyMask: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)

      ZStack {
        Image(systemName: "paperplane.fill")
          .resizable()
          .scaledToFit()
        
        Image(systemName: "folder.fill.badge.questionmark")
          .resizable()
          .scaledToFit()
          .offset(x: dim * 0.5, y: dim * 0.25)
        
        Image(systemName: "lasso.sparkles")
          .resizable()
          .scaledToFit()
          .offset(x: -dim * 0.5, y: -dim * 0.25)
      }
    }
  }
  
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      
      ZStack {
        
        Color.black
          .ignoresSafeArea()
        
        // Back image
        if let image = sepiaImage {
          image
            .resizable()
            .scaledToFit()
            .ignoresSafeArea()
        }
        
        // Front image
        if let image = colorInvertedImage {
          image
            .resizable()
            .scaledToFit()
            .ignoresSafeArea()

            .mask(
              funnyMask
                .frame(width: dim * maskSize, height: dim * maskSize)
                .animation(.easeIn(duration: 2).delay(2), value: maskSize)
                .blur(radius: 0)
            )
        }
      }
      .opacity(visible ? 1.0 : 0.0)
      .animation(.easeIn(duration: 1), value: visible)
      .blur(radius: shouldBlur ? 20 : 0)
      .animation(.easeIn(duration: 1).delay(1), value: shouldBlur)
    }
    .background(Color.black)
    .foregroundColor(.white)
    .onAppear {
      loadImages()
      processImages()
      visible = true
      shouldBlur = false
      maskSize = 100
    }
    
  }
  
  func loadImages() {
    let bundlePath = Bundle.main.path(forResource: "arthured", ofType: "jpg")!
    guard let inputImage = UIImage(contentsOfFile: bundlePath) else { return }
    
    let ciimage = CIImage(image: inputImage)
    // load the filters with image data
    sepia.setValue(ciimage, forKey: kCIInputImageKey)
    colorInvert.setValue(ciimage, forKey: kCIInputImageKey)
  }
  
  func processImages() {
    guard let outputImage = sepia.outputImage else { return }
    if let cgimage = context.createCGImage(outputImage, from: outputImage.extent) {
      let uiimage = UIImage(cgImage: cgimage)
      sepiaImage = Image(uiImage: uiimage)
    }
    
    guard let oi = colorInvert.outputImage else { return }
    if let cgimage = context.createCGImage(oi, from: oi.extent) {
      let uiimage = UIImage(cgImage: cgimage)
      colorInvertedImage = Image(uiImage: uiimage)
    }
    
  }
}

struct RDR2SplashView_Previews: PreviewProvider {
  static var previews: some View {
    RDR2Splash()
  }
}
