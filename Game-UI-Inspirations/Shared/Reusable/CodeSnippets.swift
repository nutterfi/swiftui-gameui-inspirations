//
//  CodeSnippets.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 11/9/21.
//

import UIKit

func printFonts() {
  for family in UIFont.familyNames {
      print("\(family)")

      for name in UIFont.fontNames(forFamilyName: family) {
          print("\(name)")
      }
  }
}
