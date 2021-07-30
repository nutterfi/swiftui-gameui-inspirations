//
//  RDR2AwardItem.swift
//  RDR2AwardItem
//
//  Created by nutterfi on 7/29/21.
//

import SwiftUI
import Shapes

struct RDR2AwardItem: View {
  var image: String
  var progress: Float // between 0...1
  var foreground: Color = .white
  var background: Color = .black
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          Color("rdr2Gray", bundle: nil)
            
          Polygon(sides: 6)
            .stroke(foreground, lineWidth: 3)
            .frame(width: dim * 0.5, height: dim * 0.5)
            .background(background.mask(Polygon(sides: 6)))
            .rotationEffect(.degrees(90))
          
          Image(systemName: image)
            .resizable()
            .scaledToFit()
            .frame(width: dim * 0.25, height: dim * 0.25)
            .foregroundColor(foreground)
          
          VStack {
            Spacer()
            ProgressBar(progress: progress, backView: Color("rdr2AwardProgressGray", bundle: nil), frontView: Color("rdr2White", bundle: nil))
              .frame(height: dim * 0.1)
          }
           
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct RDR2AwardItem_Previews: PreviewProvider {
    static var previews: some View {
      ZStack {
        Color.black.ignoresSafeArea()
        RDR2AwardItem(image: "lasso", progress: 0.25)
          .frame(width: 300, height: 200)
      }
    }
}
