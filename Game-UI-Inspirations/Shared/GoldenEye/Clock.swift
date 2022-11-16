//
//  Clock.swift
//  Game-UI-Inspirations (iOS)
//
//  Created by nutterfi on 10/8/22.
//

import SwiftUI
import Shapes
import Combine

class ClockModel: ObservableObject {
  
  @Published private(set) var date: Date
  
  var subscribers = Set<AnyCancellable>()
  
  init() {
    date = Date()
    let _: () = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
      .sink { value in
        self.date = Date()
      }
      .store(in: &subscribers)
  }
}

struct Clock: View {
  @StateObject var model = ClockModel()

  @State private var hours: Double = 0
  @State private var minutes: Double = 0
  @State private var seconds: Double = 0
  
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        Kite(pointRatio: 0.2)
          .stroke(lineWidth: 2)
          .frame(width: 12, height: dim * 0.25)
          .rotationEffect(.degrees((hours + minutes/60) * 360.0 / 12), anchor: .bottom)
          .offset(x: 0, y: -dim * 0.125)
        
        Kite(pointRatio: 0.2)
          .stroke()
          .frame(width: 8, height: dim * 0.5)
          .rotationEffect(.degrees((minutes + seconds/60) * 360.0 / 60), anchor: .bottom)
          .offset(x: 0, y: -dim * 0.25)
        
        Kite(pointRatio: 0.2)
          .stroke()
          .frame(width: 5, height: dim * 0.5)
          .rotationEffect(.degrees(seconds * 360 / 60), anchor: .bottom)
          .offset(x: 0, y: -dim * 0.25)
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
    .onChange(of: model.date, perform: { newValue in
      updateTime()
    })
    .padding()
    
  }

  func updateTime() {
    let components = Calendar.current.dateComponents([.hour, .minute, .second], from: model.date)
    hours = Double(components.hour ?? 0)
    minutes = Double(components.minute ?? 0)
    seconds = Double(components.second ?? 0)
  }
}

struct Clock_Previews: PreviewProvider {
  static var previews: some View {
    Clock()
    .frame(width: 256, height: 256)
  }
}
