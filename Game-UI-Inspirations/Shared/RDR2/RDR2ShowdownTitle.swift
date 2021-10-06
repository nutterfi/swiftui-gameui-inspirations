//
//  RDR2ShowdownTitle.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 10/5/21.
//

import SwiftUI
import Shapes

struct RDR2ShowdownTitle: View {
  var title: String
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        Group {
          InvertedCornerRectangle(cornerRadius: dim / 6)
            .stroke()
          InvertedCornerRectangle(cornerRadius: dim / 6)
            .inset(by: 5)
            .stroke()
          Text(title.uppercased())
            .font(.custom("AmericanTypewriter", size: dim / 3))
          
          let frameParam: CGFloat = dim / 15
          
          let vertices = Quad()
            .vertices(in: CGRect(origin: .zero, size: proxy.size).inset(by: UIEdgeInsets(top: frameParam, left: frameParam, bottom: frameParam, right: frameParam)))

          Group {
            Reuleaux.pentagon // bottom left
              .frame(width: frameParam, height: frameParam)
              .rotationEffect(.degrees(45))
              .offset(x: -proxy.size.width * 0.5 + vertices[3].x, y: -proxy.size.height * 0.5 + vertices[3].y)
            
            Reuleaux.pentagon // bottom right
              .frame(width: frameParam, height: frameParam)
              .rotationEffect(.degrees(-45))
              .offset(x: -proxy.size.width * 0.5 + vertices[2].x, y: -proxy.size.height * 0.5 + vertices[2].y)
            
            Reuleaux.pentagon  // top left
              .frame(width: frameParam, height: frameParam)
              .rotationEffect(.degrees(135))
              .offset(x: -proxy.size.width * 0.5 + vertices[0].x, y: -proxy.size.height * 0.5 + vertices[0].y)
            
            Reuleaux.pentagon // top right
              .frame(width: frameParam, height: frameParam)
              .rotationEffect(.degrees(-135))
              .offset(x: -proxy.size.width * 0.5 + vertices[1].x, y: -proxy.size.height * 0.5 + vertices[1].y)
          }
        }
        .foregroundColor(.white)
      }
      .background(Color.black)
      .frame(width: proxy.size.width, height: proxy.size.height)

    }
  }
}

  struct RDR2ShowdownTitle_Previews: PreviewProvider {
    static var previews: some View {
      Group {
        RDR2ShowdownTitle(title: "If the boot fits...")
          .frame(width: 512, height: 128)
        
        RDR2ShowdownTitle(title: "If the hat fits...")
          .frame(width: 256, height: 64)
        
        RDR2ShowdownTitle(title: "If the gun fits...")
          .frame(width: 512, height: 64)
      }
      .previewLayout(.sizeThatFits)
    }
  }
