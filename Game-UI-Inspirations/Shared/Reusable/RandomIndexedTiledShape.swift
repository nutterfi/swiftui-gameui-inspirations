import SwiftUI

public struct RandomIndexedTiledShape<Content: Shape>: Shape {
  public var shape: Content
  public var rows: Int
  public var columns: Int
  public var unpaintedIndices: [CGPoint]
  
  public init(shape: Content, rows: Int = 1, columns: Int = 1, unpaintedIndices: [CGPoint] = []) {
    self.shape = shape
    self.rows = rows
    self.columns = columns
    self.unpaintedIndices = unpaintedIndices
  }
  
  public func path(in rect: CGRect) -> Path {
    Path { path in
      let width = rect.width / CGFloat(columns)
      let height = rect.height / CGFloat(rows)
      for r in 0..<rows {
        for c in 0..<columns {
          if unpaintedIndices.contains(CGPoint(x: r, y: c)) {
            continue
          }
          let origin = CGPoint(
            x: rect.minX + CGFloat(c) * width,
            y: rect.minY + CGFloat(r) * height
          )
          let iRect = CGRect(origin: origin, size: CGSize(width: width, height: height))
          
          path.addPath(shape.path(in: iRect))
        }
      }
    }
  }
}
