import Foundation
import SwiftUI

extension CGRect {
  func offsetBy(magnitude: Double, angle: Angle) -> CGRect {
    let x = magnitude * cos(angle.radians)
    let y = magnitude * sin(angle.radians)
    return self.offsetBy(dx: x, dy: y)
  }
}
