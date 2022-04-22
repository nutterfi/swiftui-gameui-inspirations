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
    UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0.0)
    guard let context = UIGraphicsGetCurrentContext() else { return UIImage() }
    layer.render(in: context)
    let image = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    return image
  }
}

extension View {
  func uiimage(rect: CGRect) -> UIImage {
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
