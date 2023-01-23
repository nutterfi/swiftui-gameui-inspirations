//
//  InvertedShape.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 1/22/23.
//

import SwiftUI
import Shapes

public struct InvertedShape<Content: Shape>: Shape {
  public var shape: Content
  public var inset: CGFloat
  
  public var animatableData: CGFloat {
    get {
      inset
    }
    set {
      inset = newValue
    }
  }
  
  public init(shape: Content, inset: CGFloat = .zero) {
    self.shape = shape
    self.inset = inset
  }
  
  public func path(in rect: CGRect) -> Path {
    Path { path in
      let insetRect = rect.insetBy(dx: inset, dy: inset)
      
      let framePath = Path(rect)
      let shapePath = shape.path(in: insetRect)
      let difference = shapePath.cgPath.symmetricDifference(framePath.cgPath)
      
      path.addPath(Path(difference))
    }
  }
}

extension Shape {
  @inlinable public func invert(inset: CGFloat = .zero) -> InvertedShape<Self> {
    InvertedShape(shape: self, inset: inset)
  }
}

struct InvertedShapeDemo: View {
  @State var isAnimating = false

  var body: some View {
    ZStack {
      Color.purple.ignoresSafeArea()
      Text(isAnimating ? "TEST" : "HELLO TWITCH")
        .font(.system(size: 87))
      InvertedShape(shape: Reuleaux.triangle)
        .foregroundStyle(LinearGradient(colors: [.red, .black, .green], startPoint: .topLeading, endPoint: .bottomTrailing))
        .opacity(0.9)
        .blur(radius: isAnimating ? 5 : 0)
        .animation(.linear(duration: 1).repeatForever(), value: isAnimating)
        .frame(width: 256, height: 256)

      Reuleaux.triangle
        .invert(inset: isAnimating ? 20 : 0)
        .fill(Color.orange)
        .animation(.linear(duration: 1).repeatForever(), value: isAnimating)
        .frame(width: 128, height: 256)
      
    }
    .onAppear {
      isAnimating = true
    }
  }
}

struct InvertedShape_Previews: PreviewProvider {
  @State static var isAnimating = false
  static var previews: some View {
    InvertedShapeDemo()
  }
}
