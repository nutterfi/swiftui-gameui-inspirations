//
//  DiamondDogsLogo.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/25/21.
//

import SwiftUI

struct DiamondDogsLogo: View {
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          DiamondGem()
            .stroke(Color.black, lineWidth: dim / 25)
            .frame(width: dim, height: dim)
          
          Color.yellow
//            .fill(Color.yellow)
            .frame(width: dim, height: dim / 3)
            .mask(RibbonBanner())
            .overlay(RibbonBanner().stroke(Color.black, lineWidth: dim / 50))
//          Text("Diamond Dogs".uppercased())
//            .foregroundColor(.white)
//            .font(.largeTitle)
//            .offset(x: 0, y: dim / 40)
          DiamondDog()
            .fill(Color.black)
            .frame(width: dim * 0.7, height: dim / 2)
            .offset(x: 0, y: -dim / 5)
            
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
          
    }
}

struct DiamondDogsLogo_Previews: PreviewProvider {
    static var previews: some View {
      HStack {
        DiamondDogsLogo()
          .padding()
      }
      
    }
}

/*
 TODO
 Text that can be skewed
 Refine Dog Picture
 Fix weird artifact when filling banner color
 Color pattern for diamond
 
 **/
