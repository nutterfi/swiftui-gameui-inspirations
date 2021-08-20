//
//  RDR2Badgeable.swift
//  RDR2Badgeable
//
//  Created by nutterfi on 8/19/21.
//

import SwiftUI

protocol RDR2Badgeable {
  func colors(for rank: String) -> (Color, Color)
}

extension RDR2Badgeable {
  func colors(for rank: String) -> (Color, Color) {
    switch rank {
    case RDR2Award.Rank.gold:
      return (Color("rdr2Gold"), Color("rdr2Rust"))
    case RDR2Award.Rank.teal:
      return (Color("rdr2Teal"), Color("rdr2Black"))
    case RDR2Award.Rank.bronze:
      return (Color("rdr2Bronze"), Color("rdr2Black"))
    case RDR2Award.Rank.teal:
      return (Color("rdr2Teal"), Color("rdr2Black"))
    case RDR2Award.Rank.gray:
      return (Color("rdr2Gray-1"), Color("rdr2Black"))
    default:
      return (.white, .black)
    }
  }
}
