//
//  ContentView.swift
//  MK11-KombatKard
//
//  Created by nutterfi on 3/19/21.
//

import SwiftUI
import Shapes

struct KombatKardContentView: View {
  @State private var cornerRadius: Float = 0
    var body: some View {
      VStack {
        // 0...1
        Slider(value: $cornerRadius)
        
        Spacer()
        
        InvertedCornerRectangle(cornerRadius: CGFloat(cornerRadius) * 1000)
            .stroke(Color.red, lineWidth: 5)
          .frame(width: 200, height: 200)
        
        Spacer()
      }
      .padding()
    }
}

struct KombatKardContentView_Previews: PreviewProvider {
    static var previews: some View {
      KombatKardContentView()
    }
}
