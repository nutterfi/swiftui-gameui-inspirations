//
//  FF7ViewFeed.swift
//  Game-UI-Inspirations (iOS)
//
//  Created by nutterfi on 4/22/23.
//

import SwiftUI

// OPEN ISSUES:
// 1. Frame height of each FF7View
// 2. Animation of items underneath

struct FF7FeedItem: Identifiable {
  var id = UUID()
  var text: String
}

class FF7FeedModel: ObservableObject {
  @Published private(set) var items: [FF7FeedItem] = []
  
  private var timer: Timer?
  static var source: [String] = {
    [
      "Hope the slums are all right.",
      "Do you really think it was a bomb?",
      "I don't know. Might've just been a rumor.",
      "The day started out so normal...",
      "The whole house started shaking. Just like that!"
    ]
  }()
  
  init() {
    timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true, block: { timer in
      let count = self.items.count
      guard count < FF7FeedModel.source.count else {
        timer.invalidate()
        return
      }
      self.items.append(
        FF7FeedItem(text: FF7FeedModel.source[count])
      )
    })
    timer?.fire()
  }
}

struct FF7ViewFeed: View {
  @StateObject private var feed = FF7FeedModel()
  @State private var isAnimating = false
    var body: some View {
      ZStack(alignment: .top) {
        LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
          .ignoresSafeArea()
        
        withAnimation {
          VStack {
            ForEach(feed.items) { item in
              FF7View(text: item.text)
                .opacity(isAnimating ? 1.0 : 0.0)
                .animation(.easeIn(duration: 0.25), value: isAnimating)
                .frame(width: 350)
            }
            Spacer()
          }
          .disabled(true)
        }
      }
      .task {
        isAnimating = true
      }
    }
}

struct FF7ViewFeed_Previews: PreviewProvider {
    static var previews: some View {
        FF7ViewFeed()
    }
}
