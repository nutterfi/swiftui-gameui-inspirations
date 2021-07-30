//
//  RDR2AwardView.swift
//  RDR2AwardView
//
//  Created by nutterfi on 7/29/21.
//

import SwiftUI

// MODEL
struct RDR2Award: Identifiable {
  var id: UUID
  var progress: Float
  var image: String
  var rank: String
  
  struct Rank {
    static let gold = "gold"
    static let silver = "silver"
    
  }
}

class RDR2AwardViewModel: ObservableObject {
  @Published private(set) var items: [RDR2Award]
  
  init() {
    items = []
  }
}

struct RDR2AwardView: View {
  @StateObject private var viewModel = RDR2AwardViewModel()
  
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        
        let gridItems = [GridItem(), GridItem()]
        
        ZStack {
          Color.black.ignoresSafeArea()
          LazyVGrid(columns:gridItems) {
            
            ForEach(0..<viewModel.items.count) { item in
              // TODO: Create RDR2AwardItems from view model
            }
            
            RDR2AwardItem(image: "lasso", progress: 0.7, foreground: Color("rdr2Gold"), background: Color("rdr2Rust"))
              .frame(height: dim * 0.25)
            
            RDR2AwardItem(image: "lasso.sparkles", progress: 0.1, foreground: Color("rdr2Teal"), background: Color("rdr2Black"))
              .frame(height: dim * 0.25)
            
            RDR2AwardItem(image: "hare", progress: 0.3,
                          foreground: Color("rdr2Bronze"), background: Color("rdr2Black"))
              .frame(height: dim * 0.25)

            
            RDR2AwardItem(image: "eye", progress: 0,
                          foreground: Color("rdr2Gray-1"), background: Color("rdr2Black"))
              .frame(height: dim * 0.25)
            
            RDR2AwardItem(image: "mustache", progress: 0.7)
              .frame(height: dim * 0.25)
            
            RDR2AwardItem(image: "person.fill.questionmark", progress: 0.1)
              .frame(height: dim * 0.25)
            
            RDR2AwardItem(image: "flame", progress: 0.3)
              .frame(height: dim * 0.25)

            
            RDR2AwardItem(image: "leaf.fill", progress: 0)
              .frame(height: dim * 0.25)
            
          }
          
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct RDR2AwardView_Previews: PreviewProvider {
    static var previews: some View {
        RDR2AwardView()
    }
}
