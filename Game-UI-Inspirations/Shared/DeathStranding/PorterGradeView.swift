//
//  PorterGradeView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 1/4/22.
//

import SwiftUI
import Shapes

extension Color {
  static var porterDarkGreen: Color {
    Color(red: 0, green: 52/255, blue: 21/255)
  }
  static var porterlightGreen: Color {
    Color(red: 5/255, green: 121/255, blue: 69/255)
  }
  static var porterText: Color {
    Color(red: 138/255, green: 183/255, blue: 183/255)
  }
}

struct PorterGradeSkillView: View {
  var level: String = "02"
  var label: String = "Cargo Condition"
  
  var body: some View {
    VStack(alignment:.leading) {
      Text(level)
        .font(.system(size: 20, design: .rounded))
        
//      ProgressBar(progress: 0.2, backView: Color.clear, frontView: Color.blue)
//
      Text(label)
        .font(.system(size: 12, design: .rounded))
    }
    .foregroundColor(.porterText)
  }
}

/**
 Inner pentagon vertices need to make triangles with the center of the star and the midpoint of the edge of the pentagon
 
 Compute the height of the triangles as a function of 'level' of the porter grade for each system
 */

/// Porter Grade determined by summation of all 'subgrades' listed here
/// Maximum level for each subgrade is 10
///  0 - 100% completion or just level number
struct PorterGradeModel {
  var bridgeLink: CGFloat
  var cargoCondition: CGFloat
  var misc: CGFloat
  var deliveryVolume: CGFloat
  var deliveryTime: CGFloat
}

class PorterGradeViewModel: ObservableObject {
  @Published var model = PorterGradeModel(bridgeLink: 0, cargoCondition: 0.2, misc: 0.7, deliveryVolume: 0.2, deliveryTime: 0)
  
  func value(at index: Int) -> CGFloat {
    switch index {
    case 0:
      return model.bridgeLink
    case 1:
      return model.cargoCondition
    case 2:
      return model.misc
    case 3:
      return model.deliveryVolume
    case 4:
      return model.deliveryTime
    default:
      return 0.0
    }
  }
}

struct PorterGradeView: View {
  var sides: Int
  @StateObject var viewModel = PorterGradeViewModel()
  
  var body: some View {
    VStack {
      Slider(value: $viewModel.model.bridgeLink)
      Slider(value: $viewModel.model.cargoCondition)
      Slider(value: $viewModel.model.misc)
      Slider(value: $viewModel.model.deliveryVolume)
      Slider(value: $viewModel.model.deliveryTime)

      GeometryReader { proxy in
        let rect = proxy.frame(in: .local)
        let dim = min(proxy.size.width, proxy.size.height)
        
        ZStack {
          Color.black.ignoresSafeArea()
          StarPolygon(points: sides, density: 2)
            .stroke(Color.gray, lineWidth: 0.2)
          
          // includes outer(star) and inner (pentagon) vertices
          // use the outer points as the maximum
          // compute the midpoint of the pentagon vertices
          // one way to do this is by getting point-1 and point+1 (if point = star tip)
          // and taking point-1.x + point+1.x / 2, same for y
          // the annoying thing is having to determine the indeces of the vertices for each triangle
          // TOP [0] is the max
          // midpoint (computed above) is the min
          // actual is min + fraction of the distance between min and max
          let vertices = IsotoxalPolygon(sides: sides * 2, innerRadius: 0.38)
            .vertices(in: proxy.frame(in: .local))
          
          // 2 paths per subgrade, to draw symmetric triangles with different colors
          // location of the point of the star needs to be between the inner pentagon edge and the star point
          //vertices[0], vertices[2], vertices[4], vertices[6]
          
          let maxPoint = vertices.first!
          let leftPoint = vertices[vertices.count - 1]
          let rightPoint = vertices[1]
          let minPoint = CGPoint(x: (leftPoint.x + rightPoint.x) * 0.5, y: (leftPoint.y + rightPoint.y) * 0.5) // midpoint actually...
          
          ForEach(0..<sides) { index in
            let fIndex = CGFloat(index)
            let rotation: Angle = .degrees(360.0/CGFloat(sides) * fIndex)
            let percentage = viewModel.value(at: index)
            
            let actualPoint = CGPoint(x: minPoint.x, y: minPoint.y - percentage * abs(maxPoint.y - minPoint.y))
            
            Path { path in
              path.move(to: actualPoint)
              path.addLine(to: vertices[1])
              path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
              path.closeSubpath()
            }
            .fill(Color.porterlightGreen)
            .rotationEffect(rotation)
            
            Path { path in
              path.move(to: actualPoint)
              path.addLine(to: vertices[vertices.count - 1])
              path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
              path.closeSubpath()
            }
            .fill(Color.porterDarkGreen)
            .rotationEffect(rotation)
          }
          
          // LABELS
          PorterGradeSkillView(level: "02", label: "Cargo Condition")
            .offset(x: dim * 0.4, y: dim * 0.1)
          
          // LABELS
          PorterGradeSkillView(level: "06", label: "Miscellaneous")
          
            .offset(x: dim * 0.4, y: dim * 0.3)
          
          // LABELS
          PorterGradeSkillView(level: "00", label: "Delivery Time")
          
            .offset(x: -dim * 0.3, y: dim * 0.1)
          
          // LABELS
          PorterGradeSkillView(level: "02", label: "Delivery Volume")
          
            .offset(x: -dim * 0.3, y: dim * 0.2)
          
          // LABELS
          PorterGradeSkillView(level: "00", label: "Bridge Link")
          
            .offset(x: -dim * 0.25, y: -dim * 0.3)
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
  }
}

struct PorterGradeView_Previews: PreviewProvider {
  static var previews: some View {
    PorterGradeView(sides: 5)
  }
}
