//
//  Color+Extensions.swift
//
//  Created by nutterfi on 3/20/21.
//

import SwiftUI


extension Color {
  
  static var randomBlue: Color {
    let r = CGFloat.random(in: 0...1)
    let g = CGFloat.random(in: 0...1)
    return .init(red: r, green: g, blue: 1)
  }
  
  static var random: Color {
    let r = CGFloat.random(in: 0...1)
    let g = CGFloat.random(in: 0...1)
    let b = CGFloat.random(in: 0...1)
    return .init(red: r, green: g, blue: b)
  }
  
  static var controlYellow: Color {
    Color(red: 1, green: 1, blue: 59.0/255)
  }
  
  static var rdr2Minimap: Color {
    Color(red: 222.0/255, green: 214.0/255, blue: 192.0/255)
  }
  
  static var tlouSecondary: Color {
    Color(red: 236.0/255, green: 232.0/255, blue: 209.0/255)
  }
  
  static var tlouYellow: Color {
    Color(red: 173.0/255, green: 156.0/255, blue: 93.0/255)
  }
  
  static var hadesZeusYellow: Color {
    Color(red: 251/255, green: 246/255, blue: 92/255)
  }
  
  static var hadesZeusOrange: Color {
    Color(red: 252/255, green: 186/255, blue: 67/255)
  }
  
  static var hadesAphroditePink: Color {
    Color(red: 247/255, green: 167/255, blue: 251/255)
  }
  
  static var hadesAphroditeMagenta: Color {
    Color(red: 249/255, green: 110/255, blue: 211/255)
  }
  
  static var hadesArtemisYellow: Color {
    Color(red: 217/255, green: 242/255, blue: 72/255)
  }
  
  static var hadesArtemisGreen: Color {
    Color(red: 190/255, green: 237/255, blue: 79/255)
  }
  
  static var hadesAresRed: Color {
    Color(red: 235/255, green: 74/255, blue: 64/255)
  }
  
  static var spiderManTeal: Color {
    Color(red: 16/255, green: 59/255, blue: 79/255)
  }
  
  static var spiderManSkillBorder: Color {
    Color(red: 67/255, green: 108/255, blue: 118/255)
  }
    
  static var spiderManSkillFillLocked: Color {
    Color(red: 24/255, green: 34/255, blue: 48/255)
  }
  
  static var spiderManUnlockedIconFill: Color {
    Color(red: 18/255, green: 253/255, blue: 255/255)
  }
  
  static var lostArkBrown: Color {
    Color(red: 58/255, green: 48/255, blue: 38/255)
  }
  
  static var lostArkLightBrown: Color {
    Color(red: 131/255, green: 112/255, blue: 87/255)
  }

  static var acoGold: Color {
    Color(red: 243/255, green: 233/255, blue: 157/255)
  }
  
  static var acoBrown: Color {
    Color(red: 51/255, green: 39/255, blue: 26/255)
  }
  
  static var acoNotQuiteBlack: Color {
    Color(red: 10/255, green: 12/255, blue: 8/255)
  }
  
  static var acoGoldAgain: Color {
    Color(red: 245/255, green: 203/255, blue: 92/255)
  }
  
  static var acoBlue: Color {
    Color(red: 38/255, green: 51/255, blue: 67/255)
  }
  
}
