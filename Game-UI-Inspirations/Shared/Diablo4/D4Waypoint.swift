import SwiftUI
import Shapes

/// Stay awhile and listen
struct D4Waypoint: View {
  @State private var isAnimating = false
  
    var body: some View {
      ZStack {
        Circle()
          .foregroundColor(.gray)
        
        StrokeStyledCircle(
          numberOfSegments: 6,
          dashPattern: [20, 5, 50, 5, 20, 5], lineWidth: 20
        )
        .inset(by: 20)
        .stroke()
        
        let polygon = ConvexPolygon(sides: 3)
        let vertices = polygon.vertices(in: .init(x: 0, y: 0, width: 300, height: 300).insetBy(dx: 30, dy: 30))
        
        Circle()
          .stroke()
        
        ForEach(0..<vertices.count) { index in
          let vertex = vertices[index]
          
          Circle()
            .foregroundColor(.gray)
            .frame(width: 26, height: 26)
            .position(vertex)
          
          Circle()
            .foregroundStyle(
              RadialGradient(colors: [.white, .blue], center: .center, startRadius: 0, endRadius: 20)
            )
            .frame(width: 20, height: 20)
            .position(vertex)
        }
        
        ZStack {
          let polygon = ConvexPolygon(sides: 3)
          let vertices = polygon.vertices(in: .init(x: 0, y: 0, width: 100, height: 100))
          
          Circle()
            .stroke()
          
          ForEach(0..<vertices.count) { index in
            let vertex = vertices[index]
            
            Circle()
              .foregroundColor(.gray)
              .overlay(Circle().stroke())
              .frame(width: 66, height: 66)
              .position(vertex)
          }
          
          polygon
            .stroke()
          
          
        }
        .frame(width: 100, height: 100)
      }
      .frame(width: 300, height: 300)
      .rotationEffect(.degrees(isAnimating ? 360 : 0))
      .animation(.easeInOut(duration: 1), value: isAnimating)
      .rotation3DEffect(.degrees(30), axis: (x: 1, y: 0, z: 0))
      .onTapGesture {
        isAnimating.toggle()
      }
    }
}

struct D4Waypoint_Previews: PreviewProvider {
    static var previews: some View {
      D4Waypoint()
    }
}
