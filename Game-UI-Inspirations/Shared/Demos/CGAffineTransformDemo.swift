import SwiftUI

/*
 CGAffineTransform Demo
 
 This demo visualizes how changes to CGAffineTransform parameters affect the rendered shape.
 
 The a,b,c, and d values are normalized between -1 and 1.
 The tx and ty values are translation values that allow us to offset the shape completely outside of the bounds of its frame.
 
 */

struct CGAffineTransformDemo: View {
  @State private var transform: CGAffineTransform = .identity
  let dimension: CGFloat = 100.0
  var body: some View {
    VStack(spacing: 20) {
      Text("CGAffineTransform Demo")
        .font(.title)
      
      Text("CGAffineTransform(a: \(String(format: "%.02f", transform.a)), b: \(String(format: "%.02f", transform.b)), c: \(String(format: "%.02f", transform.c)), d: \(String(format: "%.02f", transform.d)), tx: \(String(format: "%.02f", transform.tx)), ty: \(String(format: "%.02f", transform.ty)))")
        .monospacedDigit()
      
      VStack(spacing: 0) {
        VStack(spacing: 30) {
          Group {
            SliderLabelView(value: $transform.a, label: "A", range: -1...1)
            SliderLabelView(value: $transform.b, label: "B", range: -1...1)
            SliderLabelView(value: $transform.c, label: "C", range: -1...1)
            SliderLabelView(value: $transform.d, label: "D", range: -1...1)
            SliderLabelView(value: $transform.tx, label: "Tx", range: -dimension...dimension)
            SliderLabelView(value: $transform.ty, label: "Ty", range: -dimension...dimension)
          }
          
          Button {
            transform = .identity
          } label: {
            Text("Reset")
          }
          
        }
        .frame(width: 300)
        
        VStack {
          
          Circle().stroke(lineWidth: 5)
            .frame(width: dimension, height: dimension)
            .border(Color.red)
            .transformEffect(transform)
        }
        .frame(width: dimension * 3, height: dimension * 3)
        
      }
    }
    .padding()
    
  }
}

struct CGAffineTransformDemo_Previews: PreviewProvider {
  static var previews: some View {
    CGAffineTransformDemo()
  }
}
