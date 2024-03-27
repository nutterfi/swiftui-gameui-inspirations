//
//  Image.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 3/26/24.
//

import SwiftUI

extension Image {
  init(cgImage: CGImage) {
    #if canImport(UIKit)
    self.init(uiImage: UIImage(cgImage: cgImage))
    #else
    self.init(nsImage: NSImage(cgImage: cgImage, size: CGSize(width: cgImage.width, height: cgImage.height)))
    #endif
  }
}
