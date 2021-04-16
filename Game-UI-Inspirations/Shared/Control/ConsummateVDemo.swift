//
//  ConsummateVDemo.swift
//  Control-Loading-Animations
//
//  Created by nutterfi on 3/4/21.
//

import SwiftUI

struct ConsummateVDemo: View {
    var body: some View {
      VStack {
        ConsummateV(count: 4, lineWidth: 1)
          .frame(width: 40, height: 40)
          .foregroundColor(.white)
        ConsummateV(count: 10, lineWidth: 1)
          .frame(width: 200, height: 100)
          .foregroundColor(.red)
        ConsummateV(count: 3, lineWidth: 20)
          .frame(width: 100, height: 200)
          .foregroundColor(.purple)
      }
      .padding()
      .background(Color.black)
    }
}

struct MultipleVs_Previews: PreviewProvider {
    static var previews: some View {
        ConsummateVDemo()
    }
}
