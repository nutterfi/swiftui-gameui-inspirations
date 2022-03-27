//
//  Games.swift
//  Games
//
//  Created by nutterfi on 8/10/21.
//

import Foundation

struct Games {
  static let mgsv = "MGSV"
  static let control = "Control"
  static let mk11 = "MK11"
  static let genshinImpact = "Genshin Impact"
  static let rdr2 = "RDR2"
  static let tlou = "The Last of Us"
  static let overwatch = "Overwatch"
  static let swtor = "SWTOR"
  static let hades = "Hades"
  static let ff14 = "FFXIV"
  static let detroit = "Detroit: Become Human"
  static let destiny2 = "Destiny 2"
  static let celeste = "Celeste"
  static let spiderMan = "Spider-Man"
  static let persona5 = "Persona 5"
  static let lostArk = "Lost Ark"
}

extension Games {
  static var all: [String] {
    [Games.mgsv, Games.control, Games.mk11, Games.rdr2, Games.genshinImpact, Games.overwatch, Games.swtor, Games.tlou, Games.hades, Games.detroit, Games.destiny2, Games.celeste, Games.spiderMan, Games.persona5, Games.lostArk]
  }
}
