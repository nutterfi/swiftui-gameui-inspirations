//
//  StarsBreath.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/24/22.
//

import SwiftUI
import Shapes

struct BreathGemLabel: View {
  var descriptiveText: String = ""
  var rarity: LAItemRarity = .epic
  var tier: Tier = .two
  
  var body: some View {
    ZStack {
      LinearGradient(colors: [.black, Color(rarity.color.1)], startPoint: .top, endPoint: .bottom)
        .ignoresSafeArea()
      
      HStack() {
        BreathGem(tier: tier)
          .padding()
          .rotationEffect(.degrees(2))
        
        VStack(alignment: .leading) {
          Text(rarity.rawValue.capitalized)
            .font(.headline)
            .foregroundColor(Color(rarity.color.0))
            .shadow(color: .black, radius: 5, x: 2, y: 2)
            .padding(.vertical)
          Text(descriptiveText.capitalized)
            .foregroundColor(.white)
            .font(.headline)
            .shadow(color: .black, radius: 3, x: 1, y: 1)
            .padding(.vertical)
        }
        Spacer()
      }
      .border(.white)
      
    }
  }
}

struct BreathGem: View {
  var tier: Tier
  // outer, inner
  var gemColors: (Color, Color) {
    switch tier {
    case .one:
      return (
        Color(red: 10/255, green: 78/255, blue: 46/255),
        Color(red: 31/255, green: 177/255, blue: 46/255)
      )
    case .two:
      return (
        Color(red: 22/255, green: 67/255, blue: 129/255),
        Color(red: 65/255, green: 246/255, blue: 243/255)
      )
    case .threeLow, .threeMid:
      return (Color(red: 195/255, green: 48/255, blue: 13/255),
              Color(red: 251/255, green: 236/255, blue: 182/255))
    }
  }
  
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        ConvexPolygon(sides: 8)
          .foregroundColor(gemColors.0)
        
        // circle gradient
        
        Group {
          StarPolygon(points: 8, density: 2)
            .foregroundColor(gemColors.1)
            .overlay(
              IsotoxalPolygon(sidePairs: 8, innerRadius: 0.1)
                .shadow(color: .black, radius: 2, x: 1, y: 1)
            )
            .frame(width: dim, height: dim)
        }
        
        StarPolygon(points: 8, density: 2)
          .inset(by: dim * 0.12)
          .foregroundColor(gemColors.0)
          .rotationEffect(.degrees(22.5))
        
        ConvexPolygon(sides: 8)
          .inset(by: dim * 0.21)
          .foregroundColor(gemColors.1)
        
        Group {
          let inset = 0.22
          Torx(sides: 4, controlPointInset: 0.85)
            .inset(by: dim * inset)
            .strokeBorder(gemColors.0)
          Torx(sides: 4, controlPointInset: 0.84)
            .inset(by: dim * inset)
            .foregroundColor(gemColors.1)
          Torx(sides: 4, controlPointInset: 0.85)
            .inset(by: dim * inset)
            .strokeBorder(gemColors.0)
            .rotationEffect(.degrees(45))
          
          // circle gradient
          RadialGradient(colors: [.white, Color.white.opacity(0)], center: .center, startRadius: 0, endRadius: dim * 0.21)
            .frame(width: dim * 0.6, height: dim * 0.6)
            .offset(x: -dim * 0.1, y: -dim * 0.1)
          
          Torx(sides: 4, controlPointInset: 0.84)
            .inset(by: dim * inset)
            .foregroundColor(gemColors.1)
            .rotationEffect(.degrees(45))
        }
        .rotationEffect(.degrees(5))
        // TODO: Find a good tutorial on lens flare / gradient masking
        
        // circle gradient
        RadialGradient(colors: [.white, Color.white.opacity(0)], center: .center, startRadius: 0, endRadius: dim * 0.21)
          .frame(width: dim * 0.6, height: dim * 0.6)
        
          .offset(x: -dim * 0.2, y: -dim * 0.2)
        
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct StarsBreath_Previews: PreviewProvider {
  static var previews: some View {
    BreathGemLabel(descriptiveText: "Item Tier 1", rarity: .common, tier: .one)
      .previewLayout(.sizeThatFits)
      .frame(width: 200, height: 100)
    
    BreathGemLabel(descriptiveText: "Item Tier 2", rarity: .rare, tier: .two)
      .previewLayout(.sizeThatFits)
      .frame(width: 200, height: 100)
    
    BreathGemLabel(descriptiveText: "Item Tier 3", rarity: .epic, tier: .threeMid)
      .previewLayout(.sizeThatFits)
      .frame(width: 200, height: 100)
    
  }
}
