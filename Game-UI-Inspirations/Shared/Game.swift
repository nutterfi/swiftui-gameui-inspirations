//
//  Game.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 8/10/21.
//

import Foundation

enum Game: String, Identifiable, Hashable, CaseIterable {
  
  var id: String { self.rawValue }
  var title: String { id }

  case mgsv = "MGSV"
  case control = "Control"
  case mk11 = "MK11"
  case genshinImpact = "Genshin Impact"
  case rdr2 = "RDR2"
  case tlou = "The Last of Us"
  case overwatch = "Overwatch"
  case overwatch2 = "Overwatch 2"
  case swtor = "SWTOR"
  case hades = "Hades"
  case ff14 = "FFXIV"
  case detroit = "Detroit: Become Human"
  case destiny2 = "Destiny 2"
  case celeste = "Celeste"
  case spiderMan = "Spider-Man"
  case persona5 = "Persona 5"
  case lostArk = "Lost Ark"
  case stardewValley = "Stardew Valley"
  case deathStranding = "Death Stranding"
  case ori = "Ori"
  case justCause4 = "Just Cause 4"
  case alanwake = "Alan Wake"
  case arkhamAsylum = "Batman: Arkham Asylum"
  case gotg = "Guardians of the Galaxy"
}
