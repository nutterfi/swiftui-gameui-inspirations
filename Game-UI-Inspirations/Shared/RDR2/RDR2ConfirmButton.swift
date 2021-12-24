//
//  RDR2ConfirmButton.swift
//  RDR2ConfirmButton
//
//  Created by nutterfi on 8/26/21.
//

import SwiftUI
import Shapes

struct RDR2ConfirmButtonDemo: View {
  @State private var progress: Float = 0.0
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        LinearGradient(colors: [.hadesArtemisGreen, .kombatBrown], startPoint: .topTrailing, endPoint: .bottom)
          .ignoresSafeArea()
        
        VStack {
          Slider(value: $progress)
            .padding()
          Spacer()
          
          RDR2ConfirmButton(value: progress)
            .frame(width: dim * 0.75, height: dim * 0.75)
          Spacer()
        }
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct RDR2ConfirmButton: View {
    var value: Float
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          Color("rdr2White")
            .frame(width: dim * 0.8, height: dim * 0.8)
          
          StrokeStyledRectangle(
            dashes: value > 0 ? 1 : 0,
            dashFillRatio: CGFloat(value),
            lineWidthRatio: 0.05,
            dashPhaseRatio: 0.87,
            lineCap: .square
          )
            .foregroundStyle(Color("rdr2White"))
          
          Text("E")
            .font(.system(size: 100))
          
          Color("rdr2White").opacity(value > 0 ? 0.5 : 0)
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
}

struct RDR2ConfirmButton_Previews: PreviewProvider {
    static var previews: some View {
      RDR2ConfirmButtonDemo()
    }
}
