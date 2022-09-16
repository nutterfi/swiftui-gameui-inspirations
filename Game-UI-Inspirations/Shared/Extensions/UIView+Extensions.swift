//
//  UIView+Extensions.swift
//  SwiftUIShaders
//
//  Created by nutterfi on 2/8/22.
//

import UIKit
import SwiftUI

extension UIView {
  var renderedImage: UIImage {
    let renderer = UIGraphicsImageRenderer(bounds: bounds)
    return renderer.image { context in
      layer.render(in: context.cgContext)
    }
  }
}

extension View {
  func uiImage(rect: CGRect) -> UIImage {
    let window = UIWindow(frame: rect)
    // iOS15 bug introduces offset in rendered image unless ignoring safe areas
    let hosting = UIHostingController(rootView: self.edgesIgnoringSafeArea(.all))
    hosting.view.frame = window.frame
    window.addSubview(hosting.view)
    hosting.view.backgroundColor = .clear
    window.makeKeyAndVisible()
    return hosting.view.renderedImage
  }
}

extension Image {

    /// Creates a SwiftUI image from a CoreGraphics image instance.
    /// - Parameter cgImage: The CoreGraphics image to wrap with a SwiftUI ``Image``
    /// instance.
  public init(cgImage: CGImage) {
    self.init(uiImage: UIImage(cgImage: cgImage))
  }
}
