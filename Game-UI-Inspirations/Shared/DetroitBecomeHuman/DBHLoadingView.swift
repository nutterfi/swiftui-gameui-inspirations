//
//  DBHLoadingView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 9/30/21.
//

import SwiftUI
import Shapes

struct DBHLoadingRingInfo : Identifiable {
  var id = UUID().uuidString
  var trimFrom: CGFloat = . zero
  var trimTo: CGFloat = 0.5
  var rotation: CGFloat = .zero
}

enum DBHLoadingRingsState: CaseIterable {
  case one
  case two
  case three
  case four
  case five
}

// WIP
class DBHLoadingRingsViewModel: ObservableObject {
  @Published private(set) var ring1 =  DBHLoadingRingInfo()
  @Published private(set) var ring2 =  DBHLoadingRingInfo()
  @Published private(set) var ring3 =  DBHLoadingRingInfo()
  @Published private(set) var ring4 =  DBHLoadingRingInfo()
  @Published private(set) var ring5 =  DBHLoadingRingInfo()
  
  private var timer: Timer?
  
  private var state: DBHLoadingRingsState = .one
  
  private let dTrim = 0.01

  func load() {
    timer = Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { [weak self] (timer) in
      guard let s = self else {
        timer.invalidate()
        return
      }

      s.update()
    }
    timer?.fire()
  }
  
  func reset() {
    ring1.trimFrom = 0
    ring1.trimTo = 0.5
    ring2.trimFrom = 0.55
    ring2.trimTo = 0.7
    ring3.trimFrom = 0.75
    ring3.trimTo = 0.95
  }
  
  func update() {
    switch state {
    case .one:
      updateOne()
    default:
      break
    }
  }
  
  func updateOne() {
    ring1.rotation += 0.05
    ring2.rotation -= 0.05
    ring3.rotation += 0.05
    
    if ring1.trimFrom < 0.25 {
      ring1.trimFrom += dTrim
    } else {
      ring1.trimTo -= dTrim
    }
    
    if ring2.trimFrom < 0.75 {
      ring2.trimFrom += dTrim
      ring2.trimTo += dTrim
    }
    
    if ring3.trimFrom > 0.25 {
      ring3.trimFrom -= dTrim
      ring3.trimTo -= dTrim
    }
    
    if ring1.trimTo <= ring1.trimFrom {
      reset()
    }
    
  }
  
}

/// I want a circle that uses strokeborder because i want to prevent the linewidth from extending beyond the frame of the view/shape
///
/// i want to use trim

struct DBHLoadingRings: View {
  @StateObject private var viewModel = DBHLoadingRingsViewModel()
  var color: Color = Color("dbhLoadingRing")
  var lineWidth: CGFloat = 10
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        ForEach([viewModel.ring1, viewModel.ring2, viewModel.ring3]) { ring in
          Circle()
            .trim(from: ring.trimFrom, to: ring.trimTo)
            .stroke(color, style: StrokeStyle(lineWidth: dim / 10, lineCap: .round, lineJoin: .miter))
            .frame(width: dim * 0.8, height: dim * 0.8)
            .rotationEffect(Angle(radians: Double(ring.rotation)))
        }
        
      }
      .rotationEffect(.radians(-.pi / 2))
      .frame(width: proxy.size.width, height: proxy.size.height)
      .onAppear {
        viewModel.load()
      }
    }
  }
}

struct DBHLoadingView: View {
  @State private var isAnimating = false
    var body: some View {
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          
          ZStack {
            ForEach(0...4, id: \.self) { index in
              IsoscelesTriangle()
                .rotation(.radians(index % 2 == 0 ? .pi : 0))
                .foregroundColor(Color.randomBlue)
                .opacity(0.05)
                .hueRotation(.degrees(isAnimating ? 180 : 0))
                .animation(Animation.easeInOut(duration: 3).repeatForever(), value: isAnimating)
                .frame(width: dim, height: dim)
                .scaleEffect(2)
                .offset(x: -proxy.size.width * 0.5 + CGFloat(index) * dim / 2, y: 0)
            }
          }
          .offset(x: isAnimating ? dim * 0.13 : -dim * 0.15,
                  y: isAnimating ? -dim * 0.18 : dim * 0.2)
          .animation(Animation.easeInOut(duration: 3).repeatForever(), value: isAnimating)
          
          
          DBHLoadingRings()
            .frame(width: dim * 0.6, height: dim * 0.6)
            .opacity(0.7)
            .background(DBHLoadingRings()
                          .opacity(0.3)
                          .offset(x: dim * 0.01, y: -dim * 0.05))
            .offset(x: isAnimating ? dim * 0.13 : -dim * 0.15,
                    y: isAnimating ? -dim * 0.18 : dim * 0.2)
            .animation(Animation.easeInOut(duration: 3).repeatForever(), value: isAnimating)

        }
        .frame(width: proxy.size.width, height: proxy.size.height)
      }
      .onAppear {
        isAnimating = true
      }
      
    }
}

struct DBHLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        DBHLoadingView()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
