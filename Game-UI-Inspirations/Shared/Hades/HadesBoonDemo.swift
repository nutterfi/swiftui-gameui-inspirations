//
//  HadesBoonDemo.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 7/1/21.
//

import SwiftUI

class HadesBoonDemoViewModel: ObservableObject {
  @Published private(set) var boons: [Boon] = []
  @Published var selectedBoon: Boon?
  
  func load() {
    let group = [
      Boon.zeus, Boon.poseidon, Boon.athena, Boon.aphrodite, Boon.artemis, Boon.ares, Boon.dionysis, Boon.hermes, Boon.chaos, Boon.demeter]
    
    boons = group.map { Boon(boon: $0) }
  }
}

struct HadesBoonDemo: View {
  @StateObject private var viewModel = HadesBoonDemoViewModel()
  
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          LinearGradient(colors: [.kombatBrown, .red, .hadesZeusOrange], startPoint: .top, endPoint: .bottomLeading)
            .ignoresSafeArea()
          
          VStack {
            BoonView(boon: viewModel.selectedBoon ?? Boon(boon: Boon.zeus), color: .purple, shouldAnimate: true)
                
            Text("\(viewModel.selectedBoon?.boon ?? "")".uppercased())
              .font(.largeTitle)
              .foregroundColor(.primary)
              
            ScrollView(.horizontal) {
              HStack {
                ForEach(viewModel.boons) { item in
                  
                  BoonView(boon: item, shouldAnimate: true)
                    .frame(width: dim / 4, height: dim / 4)
                    .overlay(
                      Circle()
                        .stroke(.purple, lineWidth: viewModel.selectedBoon == item ? 5 : 0)
                    )
                    .onTapGesture {
                      viewModel.selectedBoon = item
                    }
                }
              }
            }
            .padding()
          }
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
      .onAppear {
        viewModel.load()
      }
    }
}

struct HadesBoonDemo_Previews: PreviewProvider {
    static var previews: some View {
      HadesBoonDemo()
        .preferredColorScheme(.light)
    }
}
