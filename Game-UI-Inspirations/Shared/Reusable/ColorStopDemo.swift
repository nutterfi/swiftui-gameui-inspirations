//
//  ColorStopDemo.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 1/22/23.
//

import SwiftUI

struct ColorStopDemo: View {
    var body: some View {
      let grad = Gradient(colors: [.red, .green, .blue, .purple])
      let lg = AngularGradient(gradient: grad, center: .center)
        .frame(height: 300)
                                
      VStack {
        lg
        Text(String(describing: grad.stops))
      }
    }
}

struct ColorStopDemo_Previews: PreviewProvider {
    static var previews: some View {
        ColorStopDemo()
    }
}
