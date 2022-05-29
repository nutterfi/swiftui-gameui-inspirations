//
//  GearHoningView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/19/22.
//

import SwiftUI

struct GearHoningView: View {
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          Text("Lost Ark Gear Honing Sim")
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
        .onAppear {
          GearHoningCalculator.load()
        }
      }
    }
}

struct GearHoningView_Previews: PreviewProvider {
    static var previews: some View {
        GearHoningView()
    }
}
