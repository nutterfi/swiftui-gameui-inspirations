//
//  RDR2AwardViewModel.swift
//  RDR2AwardViewModel
//
//  Created by nutterfi on 8/19/21.
//

import Foundation

// MODEL
struct RDR2Award: Identifiable {
  var id: UUID
  var progress: Float
  var image: String
  var rank: String
  
  struct Rank {
    static let gold = "gold"
    static let silver = "silver"
    static let bronze = "bronze"
    static let teal = "teal"
    static let gray = "gray"
    static let none = "none"
  }
}

class RDR2AwardViewModel: ObservableObject {
  @Published private(set) var items: [RDR2Award]
  
  init() {
    items = [RDR2Award(id: UUID(), progress: 0.7, image: "lasso", rank: RDR2Award.Rank.gold),
             RDR2Award(id: UUID(), progress: 0.1, image: "lasso.sparkles", rank: RDR2Award.Rank.teal),
             RDR2Award(id: UUID(), progress: 0.3, image: "hare", rank: RDR2Award.Rank.bronze),
             RDR2Award(id: UUID(), progress: 0.0, image: "eye", rank: RDR2Award.Rank.gray),
             RDR2Award(id: UUID(), progress: 0.7, image: "mustache", rank: RDR2Award.Rank.none),
             RDR2Award(id: UUID(), progress: 0.1, image: "person.fill.questionmark", rank: RDR2Award.Rank.gray),
             RDR2Award(id: UUID(), progress: 0.1, image: "flame", rank: RDR2Award.Rank.none),
             RDR2Award(id: UUID(), progress: 0.1, image: "leaf.fill", rank: RDR2Award.Rank.none)
    ]
  }
}
