//
//  LongPressHoldable.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 12/16/21.
//

import SwiftUI

extension View {
  func longPressHoldable(
    minimumDuration: CGFloat = 0.5,
    maximumDistance: CGFloat = 10,
    action: @escaping (LongPressHoldable.HoldState) -> Void) -> some View {
    return modifier(
      LongPressHoldable(
        minimumDuration: minimumDuration,
        maximumDistance: maximumDistance,
        action: action
      )
    )
  }
}

/// A view modifier that provides a custom long-press-and-hold gesture to the View
struct LongPressHoldable: ViewModifier {
  @GestureState var holdState = HoldState.inactive
  
  var action: (HoldState) -> Void
  var minimumDuration: CGFloat
  var maximumDistance: CGFloat
  
  init(minimumDuration: CGFloat = 0.5,
       maximumDistance: CGFloat = 10,
       action: @escaping (HoldState) -> Void = {_ in}) {
    self.minimumDuration = minimumDuration
    self.maximumDistance = maximumDistance
    self.action = action
  }
  
  enum HoldState {
    case inactive
    case pressing
    case holding
  }
  
  var gesture: some Gesture {
    LongPressGesture(minimumDuration: minimumDuration, maximumDistance: maximumDistance)
      .sequenced(
        before: LongPressGesture(
          minimumDuration: .infinity,
          maximumDistance: maximumDistance
        )
      )
      .updating($holdState) { value, state, transaction in
        switch value {
          // Long press begins.
        case .first(true):
          state = .pressing
          // Long press confirmed, second long press may begin.
        case .second(true, _):
          state = .holding
          // holding ended or the first long press cancelled.
        default:
          state = .inactive
        }
      }
  }
  
  func body(content: Content) -> some View {
    content
      .gesture(gesture)
      .onChange(of: holdState) { value in
        action(value)
      }
  }
}

struct LongPressHoldDemo: View {
  @State private var foreGroundColor: Color = .black
  
  var body: some View {
    Circle()
      .foregroundColor(foreGroundColor)
      .longPressHoldable(maximumDistance: 100) { holdState in
        DispatchQueue.main.async {
          switch holdState {
          case .inactive:
            self.foreGroundColor = .black
          case .pressing:
            self.foreGroundColor = .orange
          case .holding:
            self.foreGroundColor = .blue
          }
        }
      }
  }
}

struct LongPressHoldable_Previews: PreviewProvider {
  static var previews: some View {
    LongPressHoldDemo()
  }
}
