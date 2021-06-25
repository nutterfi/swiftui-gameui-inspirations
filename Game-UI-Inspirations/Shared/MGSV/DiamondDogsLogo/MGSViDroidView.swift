//
//  MGSViDroidView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 6/24/21.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

class MGSViDroidViewModel : ObservableObject {
  @Published var titles: [String] = ["Cats pajama party", "Perfectly soggy bread", "Waterproof slipper slaps"]
}

struct MGSViDroidView: View {
  let context = CIContext()
  @State private var filter = CIFilter.dither()
  
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
                .foregroundColor(.blue)
              }
              .listRowBackground(Color.clear)
              .frame(height: 48)
            }
          }
          
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct MGSViDroidView_Previews: PreviewProvider {
    static var previews: some View {
      MGSViDroidView()
        .previewDevice("iPad Air (4th generation)")
    }
}
