//
//  ACONewLocationBanner.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 9/1/22.
//

import SwiftUI

struct ACONewLocationBanner: View {
  
  @State private var radius: Float = 0
  
  var layout = Array(
    repeating: GridItem(
      .flexible(minimum: 40), spacing:2),
    count: 9
  )
  
  var items: [String] = {
   [
    "figure.walk",
    "figure.roll",
    "figure.stand.line.dotted.figure.stand",
    "lungs",
    "hare",
    "figure.wave",
    "snowflake",
    "moon.stars",
    "tornado",
    "paintbrush.pointed",
    "wifi",
    "move.3d",
    "guitars",
    "smiley",
    "star.fill.left",
    "hourglass.bottomhalf.fill",
    "ladybug",
    "ant.fill",
    "crown.fill",
    "digitalcrown.arrow.clockwise",
    "airpodpro.right"
   ]
  }()
  //􀐳  where did you go?!
  
  var hieroglyphicColumn: some View {
      VStack {
        ForEach(0..<9) { _ in
          Image(systemName: items[Int.random(in: 0..<items.count)])
            .resizable()
            .scaledToFit()
            .frame(width: 32, height: 32)
        }
      }
      .padding()
  }
  
  var moreItems: [String] {
    var array = Array<String>()
    array.append(contentsOf: items)
    array.append(contentsOf: items)
    array.append(contentsOf: items)
    return array
  }
  
  var hieroglyphics: some View {
    LazyVGrid(columns: layout, spacing: -5) {
      ForEach(0..<8, id:\.self) { index in
        hieroglyphicColumn
          .shadow(color: .acoGold, radius: 5, x: 5, y: 5)
      }
    }
  }
  
  let width: CGFloat = 512
  
  var body: some View {
    ZStack {
      Color.black.opacity(1)
      VStack {
        Slider(value: $radius)
        ZStack {
          RadialGradient(
            colors: [
              Color.white,
              Color.acoGold, Color.acoGold.opacity(0)],
            center: .center,
            startRadius: 0,
            endRadius: CGFloat(width * 0.5 * CGFloat(radius))
          )
          .frame(width: width, height: width)
            .mask(
              hieroglyphics
          )
          Text("NEW LOCATION DISCOVERED")
            .foregroundColor(.white)
            .font(.system(size: 30))
            .offset(x:0, y: 50)
        }
        Spacer()
      }
    }
  }
}

struct ACOLevelUpBanner_Previews: PreviewProvider {
  static var previews: some View {
    ACONewLocationBanner()
  }
}
