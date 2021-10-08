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
    Color(red: 1, green: 1, blue: 59.0/255, opacity: 1)
  }

  static var rdr2Minimap: Color {
    Color(red: 222.0/255, green: 214.0/255, blue: 192.0/255, opacity: 1)
  }
  
  static var tlouSecondary: Color {
    Color(red: 236.0/255, green: 232.0/255, blue: 209.0/255)
  }
  
  static var tlouYellow: Color {
    Color(red: 173.0/255, green: 156.0/255, blue: 93.0/255)
  }
  
}
