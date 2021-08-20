//
//  RDR2AwardView.swift
//  RDR2AwardView
//
//  Created by nutterfi on 7/29/21.
//

import SwiftUI

struct RDR2AwardView: View {
  @StateObject private var viewModel = RDR2AwardViewModel()
  @State private var selectedAward: RDR2Award?
  
  var leftSide: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        VStack(alignment: .leading) {
          Divider()
          
          Color("rdr2Gray")
            .overlay(
              Group {
                if let selectedAward = selectedAward {
                  RDR2AwardBadge(award: selectedAward)
                } else {
                  Color("rdr2Gray")
                }
              }
            )
            .frame(height: dim * 0.75)
          
          Text("Trade".uppercased())
            .foregroundColor(.white)
            .font(.title)
          Spacer()
          Divider()
          Text("Reset progress and earn Gold Nuggets")
            .foregroundColor(.white)
          
        }
        .border(Color.red)
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
    
  }
    
  var rightSide: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        VStack {
          let itemHeight: CGFloat = dim * 0.125
          
          Divider()
          
          let gridItems = [GridItem(), GridItem(), GridItem(), GridItem()]
          
          LazyVGrid(columns:gridItems, spacing: dim * 0.05) {
            // TODO: Separate spacing between award items -- use LazyHGrid?
            ForEach(viewModel.items) { award in
              RDR2AwardItem(award: award)
                .frame(height: itemHeight)
                .onTapGesture {
                  selectedAward = award
                }
            }
            
          }
          
          Spacer()
          Divider()
          Text("Reset progress and earn Gold Nuggets")
            .foregroundColor(.white)
        }
        .border(Color.red)

      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
  
  var body: some View {
      GeometryReader { proxy in
        let dim = proxy.size.width
        
        ZStack {
          Color.black.ignoresSafeArea()
          
          VStack(alignment: .leading) {
            Text("Awards".uppercased())
              .foregroundColor(.white)
              .font(.title3)
            
            HStack(spacing: dim * 0.15) {
              leftSide
              rightSide
              .frame(width: dim * 0.6)
            }
            .padding()
          }
          
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct RDR2AwardView_Previews: PreviewProvider {
    static var previews: some View {
      RDR2AwardView()
        .previewDevice("iPad Pro (12.9-inch) (4th generation)")
.previewInterfaceOrientation(.landscapeRight)
    }
}
