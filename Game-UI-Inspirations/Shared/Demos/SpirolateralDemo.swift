//
//  SpirolateralDemo.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 10/3/21.
//

import SwiftUI
import Shapes

/**
 the spirolateral is defined by three basic factors: the turning angle, the
 number of segments or turns, and the number of repetitions, which create a closed figure.
 */
struct SpirolateralDemo: View {
  @State private var turns: CGFloat = 9.0
  @State private var turningAngle: CGFloat = 12.0
  @State private var repetitions: CGFloat = 5.0
  @State private var reversals: [Bool] = Array(repeating: false, count: 10)
  
  @State private var fill: Bool = false
  @State private var eoFill: Bool = false
  @State private var modern: Bool = false
  
  @State private var color1: Color = .blue
  @State private var color2: Color = .yellow
  @State private var gradientEnd: CGFloat = 0.5
  
  @State private var gradientType: String = "linear"

  var spiro: some Shape {
    let indexes = reversals.indices
      .filter {reversals[$0]}
      .map {$0 + 1}
    return Spirolateral(turns: modern ? [2, 1, -2, 3, -4, 3] : [Int(turns)], turningAngle: turningAngle, repetitions: Int(repetitions), reversedIndexes: indexes)
  }
  
  var body: some View {
    VStack {
            
      Text("\(Int(turns))")
      HStack {
        Text("Turns: 1")
        Slider(value: $turns, in: 1...10, step: 1)
        Text("10")
      }
      
      // Array of toggle switches that will determine reverse indexes
      let columns = [GridItem(), GridItem(), GridItem()]
      LazyVGrid(columns: columns) {
        ForEach(0..<Int(turns), id: \.self) { index in
          Toggle("Reverse \(index+1)", isOn: $reversals[index])
        }
      }
      
      VStack {
        Text("\(String(format: "%.02f", turningAngle))")
        HStack {
          Text("Turning Angle: 1deg")
          Slider(value: $turningAngle, in: 1...179, step: 1)
          Text("179deg")
        }
      }
      
      VStack {
        Text("\(Int(repetitions))")
        HStack {
          Text("Repetitions: 1")
          Slider(value: $repetitions, in: 1...100, step: 1)
          Text("100")
        }
      }
      
      HStack(spacing: 30) {
        Toggle("Modern", isOn: $modern)
          .border(Color.black)
        Toggle("fill", isOn: $fill)
          .border(Color.black)
        Toggle("eofill", isOn: $eoFill)
          .border(Color.black)
      }
      
      VStack {
        
        // Gradient Type
        Picker("", selection: $gradientType) {
          Text("Linear").tag("linear")
          Text("Radial").tag("radial")
          Text("Angular").tag("angular")
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
        
        ColorPicker("Color 1", selection: $color1)
        ColorPicker("Color 2", selection: $color2)
        HStack {
          Text("Gradient End: ")
          Slider(value: $gradientEnd)
        }
      }
      
      HStack {
        VStack {
          row(color1)
            .background(Color.white)
          row(color1)
            .background(Color.black)
        }
        
        let gradient = Gradient(stops: [
          .init(color: color1, location: 0),
          .init(color: color2, location: gradientEnd)
        ])
        
        let rg = RadialGradient(gradient: gradient, center: .center, startRadius: .zero, endRadius: gradientEnd)
        
        let rg2 = RadialGradient(colors: [color1, color2], center: .center, startRadius: 0, endRadius: 50)
        VStack {
          row(rg)
            .background(Color.white)
          row(rg2)
            .background(Color.black)
        }
      }
    }
    .padding()
    .background(Color.gray)
  }
  
  func row<S>(_ content: S) -> some View where S : ShapeStyle {
    HStack {
      example()
      fillOrStroke(content)
        .frame(width: 18, height: 18)
      fillOrStroke(content)
        .frame(width: 36, height: 36)
        .background(Color.orange)
      fillOrStroke(content)
        .frame(width: 72, height: 72)
    }
    .padding()
  }
  
  func example() -> some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      
      let rg2 = RadialGradient(colors: [color1, color2], center: .center, startRadius: 0, endRadius: gradientEnd * dim)
      
      ZStack {
        spiro
          .fill(rg2, style: .init(eoFill: eoFill, antialiased: true))
          .frame(width: dim , height: dim)
          .border(Color.purple)
      }
    }
    
  }
  
  func myShapeStyle() -> some View {
    
    Group {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          switch gradientType {
          case "linear":
            LinearGradient(colors: [color1, color2], startPoint: .bottomLeading, endPoint: .trailing)
          case "radial":
            RadialGradient(colors: [color1, color2], center: .center, startRadius: 0, endRadius: dim * gradientEnd)
          case "angular":
            AngularGradient(colors: [color1, color2], center: .center)
          default:
            Color.blue // Won't be used
          }
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
    }
  }
  
}

// I want to return a different modifier depending on a Bool input parameter
extension SpirolateralDemo {
  func fillOrStroke<S>(_ content: S) -> some View where S : ShapeStyle {
    return Group {
      if fill {
        spiro
        .fill(content, style: .init(eoFill: eoFill, antialiased: true))
        .scaledToFit()
        .border(Color.purple)
      } else {
        spiro
        .stroke(content, lineWidth: 1)
        .scaledToFit()
        .border(Color.purple)
      }
    }
  }
    
}

struct SpirolateralDemo_Previews: PreviewProvider {
    static var previews: some View {
      SpirolateralDemo()
        .previewDevice("iPad Pro (12.9-inch) (5th generation)")
    }
}
