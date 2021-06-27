//
//  MGSViDroidView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 6/24/21.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

// https://stackoverflow.com/questions/26542035/create-uiimage-with-solid-color-in-swift
extension UIColor {
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}

class MGSViDroidViewModel : ObservableObject {
  @Published var titles: [String] = ["Cats pajama party", "Perfectly soggy bread", "Waterproof slipper slaps"]
}

struct MGSViDroidView: View {
  let context = CIContext()
  
  // source imag
  @State private var inputImage: UIImage?
  // result image
  @State private var image: Image?
  @State var colorImage = UIColor.red.image(CGSize(width: 256, height: 256))

  
  @State private var filter = CIFilter.dotScreen()
  
  @StateObject private var viewModel = MGSViDroidViewModel()
  
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        let dp: Int = Int(dim / 10)
        ZStack {
          Color.black.ignoresSafeArea()
          Color.blue.opacity(0.2)
          ForEach(0..<15) { x in
            ForEach(0..<20) { y in
              Circle()
                .fill(.blue)
                .frame(width: 2, height: 2)
                .position(x: CGFloat(x * dp), y: CGFloat(y * dp))
              
            }
          }

          VStack {
            List {
              ForEach(0..<viewModel.titles.count) { index in
                HStack {
                Image(systemName: "checkmark.square")
                  .resizable()
                  .scaledToFit()
                  
                  Text("\(index) - \(viewModel.titles[index])".uppercased())
                    .font(.title2)
                  
                  Image(systemName: "")
                    .resizable()
                    .scaledToFit()
                  
                  Text("40000")
                    .font(.title2)
                  
                  Text("S")
                    .font(.title2)
                  
                  Text("0 / 2")
                    .font(.title2)

                }
                .foregroundColor(.white)
              }
              .listRowBackground(Color.clear)
              .frame(height: 48)
            }
          }
          
          // Back image
          if let image = image {
            image
              .resizable()
              .scaledToFill()
              .frame(width: dim/2, height: dim / 2)
          }
          
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
      .onAppear {
        loadImages()
        processImages()
      }

    }
  
  func loadImages() {
    let ciimage = CIImage(image: colorImage)
    // load the filters with image data
    filter.setValue(ciimage, forKey: kCIInputImageKey)
  }
  
  func processImages() {
    guard let outputImage = filter.outputImage else { return }
    if let cgimage = context.createCGImage(outputImage, from: outputImage.extent) {
      let uiimage = UIImage(cgImage: cgimage)
      image = Image(uiImage: uiimage)
    }
    
  }
}

struct MGSViDroidView_Previews: PreviewProvider {
    static var previews: some View {
      MGSViDroidView()
        .previewDevice("iPad Air (4th generation)")
    }
}
