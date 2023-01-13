//
//  OpeningCrawl.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 1/7/23.
//

import SwiftUI

struct OpeningCrawlViewModel {
  var title = "Episode IV"
  var subtitle = "A NEW HOPE"
  var text = """

It is a period of civil war. Rebel spaceships, striking from a hidden base, have won their first victory against the evil Galactic Empire.

During the battle, Rebel spies managed to steal secret plans to the Empire's ultimate weapon, the DEATH STAR, and space station with enough power to destroy an entire planet.

Pursued by the Empire's sinister agents, Princess Leia races home aboard her starship, custodian of the stolen plans that can save her people and restore freedom to the galaxy
"""
}

struct OpeningCrawl: View {
  @State var viewModel = OpeningCrawlViewModel()
  @State var isAnimating = false
    var body: some View {
      ZStack {
        Color.black.ignoresSafeArea()
//        ScrollViewReader { proxy in
        VStack {
          ScrollView {
              Text(viewModel.title)
              Text(viewModel.subtitle)
                .font(.title)
              Text(viewModel.text)
            Text(viewModel.title)
            Text(viewModel.subtitle)
              .font(.title)
            Text(viewModel.text)
            Text(viewModel.title)
            Text(viewModel.subtitle)
              .font(.title)
            Text(viewModel.text)
//                .font(.system(size: 50))
  //            Text("").id("whatever")
            }
  //          .onChange(of: viewModel.title) { newValue in
  //            withAnimation(.linear(duration: 10)) {
  //              proxy.scrollTo("whatever")
  //            }
  //          }
  //        }
          .offset(x:0, y: 100)
          .border(Color.red)
          .rotation3DEffect(
            .degrees(60),
            axis: (x: 1, y: 0, z: 0),
            anchor: .top,
            anchorZ: 8,
            perspective: 1
          )
          .scaleEffect(0.5)
          .animation(
            .linear(duration: 3),
            value: isAnimating
          )
        .foregroundColor(.starWarsYellow)
        }
      }
      .task {
        isAnimating = true
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
//          self.viewModel.title = "EP 4"
//        }
      }
    }
}

struct OpeningCrawl_Previews: PreviewProvider {
    static var previews: some View {
        OpeningCrawl()
    }
}
