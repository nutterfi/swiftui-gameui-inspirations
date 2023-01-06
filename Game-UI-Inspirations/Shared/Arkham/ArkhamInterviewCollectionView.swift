//
//  ArkhamInterviewCollectionView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 1/5/23.
//

import SwiftUI
import Shapes

/// A selectable view that begins an interview clip
struct ArkhamPatientInterviewItem: View {
  
  var isUnlocked: Bool
  var isSelected: Bool
  var isActive: Bool
  
  var body: some View {
    ZStack {
      // Selection border
      Color.black.opacity(0.01)
      StrokeStyledRectangle(
        dashes: 4,
        dashPattern: [0.16, 0.16, 0.16, 0.16, 0.16, 1],
        lineWidthRatio: 0.04,
        dashPhaseRatio: 0.25)
      .foregroundStyle(Color.arkhamGold)
      .opacity(isSelected ? 1 : 0)
      
      // Tape Image placeholder
      ZStack {
        Circle()
          .stroke(isActive ? Color.arkhamGold : isUnlocked ? .white : .gray, lineWidth: 2)
          .animation(nil, value: isActive)
        Gear(teeth: 3, spokes: 2)
          .stroke(isActive ? Color.arkhamGold : isUnlocked ? .white : .gray, lineWidth: 2)
          .animation(nil, value: isActive)
          .rotationEffect(.degrees(isActive ? 360.0 : 0.0))
          .animation( //state == .active ?
            .linear(duration: isActive ? 1.0 : 0.0)
            .repeatForever(autoreverses: false), //: nil,
            value: isActive
        )
      }
      .rotation3DEffect(.degrees(50), axis: (x: 0.5, y: 0.2, z: 0))
      .scaleEffect(0.75)
      .offset(x: 2, y: -2)
      // if the state goes to inactive, then the animation needs to STOP
      // try set the duration to 0 if inactive
      
    }
  }
}


struct InterviewItem: Identifiable {
  var id = UUID().uuidString
  var isUnlocked: Bool = true
}

class InterviewItemViewModel: ObservableObject {
  @Published var selectedItem: String? // ID of the selected item
  @Published var activeItem: String? // ID of the active item
  
  @Published var items: [InterviewItem] = [
    InterviewItem(),
    InterviewItem(),
    InterviewItem(isUnlocked: false),
    InterviewItem(isUnlocked: false),
    InterviewItem(isUnlocked: false)
  ]
  
  init() {
    selectedItem = items.first?.id
  }
  
  func selectItem(id: String) {
    if var item = items.first( where: { $0.id == id }) {
      // ignore selection requests for items that are not yet unlocked
      if !item.isUnlocked { return }
      
      // if the item to be selected is ALREADY selected, make it active
      // toggle the active state
      if selectedItem == item.id {
        activeItem = activeItem == selectedItem ? nil : selectedItem
      }

      // this always happens if the item is unlocked
      selectedItem = item.id
      
    }
  }
}

struct ArkhamInterviewCollectionView: View {
  @State private var selectedIndex: Int?
  
  @StateObject private var viewModel = InterviewItemViewModel()
  
  @State private var rotations = [String: Angle]()
  
  var interviewSelectionView: some View {
    HStack {
      ForEach(viewModel.items) { item in
        ArkhamPatientInterviewItem(
          isUnlocked: item.isUnlocked,
          isSelected: viewModel.selectedItem == item.id,
          isActive: viewModel.activeItem == item.id
        )
        .frame(width: 64, height: 64)
        .rotationEffect(rotations[item.id] ?? .zero)
        .onTapGesture {
          viewModel.selectItem(id: item.id)
        }
      }
    }
    
  }
  
  var body: some View {
    ZStack {
      Color.black.ignoresSafeArea()
      VStack(alignment: .leading) {
        Text("PATIENT INTERVIEWS")
          .font(.headline)
          .foregroundColor(.white)
        
        Text(viewModel.selectedItem?.description ?? "")
          .foregroundColor(.white)
        
        interviewSelectionView
          .padding(.horizontal)
        
        Spacer()
      }
      .border(Color.white)
      
    }
    .task {
      viewModel.items.forEach { item in
        let value = Double.random(in: -35...35)
        rotations[item.id] = .degrees(value)
      }
    }
  }
}

struct ArkhamInterviewCollectionView_Previews: PreviewProvider {
  static var previews: some View {
    ArkhamInterviewCollectionView()
  }
}
