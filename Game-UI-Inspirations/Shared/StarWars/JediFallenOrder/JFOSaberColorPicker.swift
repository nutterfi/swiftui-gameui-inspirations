//
//  JFOSaberColorPicker.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/4/23.
//

import SwiftUI
import Shapes

struct JFOSaber: Identifiable {
  var id = UUID()
  var color: Color
  
  var title: String {
    switch color {
      case .hadesAphroditeMagenta:
        return "Magenta"
      case .orange:
        return "Orange - Premium Content"
      default:
        return String(describing: color)
    }
  }
}

class JFOSaberCollection: ObservableObject {
  @Published var selectedSaber: JFOSaber
  
  @Published var sabers: [JFOSaber]
  
  init() {
    // we've unlocked all the colors
    sabers = [
        .init(color: .blue),
        .init(color: .green),
        .init(color: .purple),
        .init(color: .orange),
        .init(color: .yellow),
        .init(color: .cyan),
        .init(color: .hadesAphroditeMagenta),
        .init(color: .indigo)
    ]
  
    selectedSaber = .init(color: .blue)
    
  }
}

struct JFOSaberColorPicker: View {
  @StateObject var collection = JFOSaberCollection()

    var body: some View {
      ZStack {
        collection.selectedSaber.color.opacity(0.3).ignoresSafeArea()
        VStack {
          Text("| - \(collection.selectedSaber.title.uppercased()) - |")
            .font(.headline)
            .foregroundColor(.white)
          ScrollView(.horizontal, showsIndicators: false) {
            HStack {
              ForEach(collection.sabers) { saber in
                JFOSaberColorItem(saberColor: saber.color, isSelected: collection.selectedSaber.color == saber.color)
                  .padding(10)
                  .onTapGesture {
                    withAnimation {
                      collection.selectedSaber = saber
                    }
                  }
              }
            }
            .padding(.horizontal, 30)
          }
        }
      }
      
    }
}

struct JFOSaberColorPicker_Previews: PreviewProvider {
    static var previews: some View {
      JFOSaberColorPicker()
        .background(Color.black)
        .previewLayout(.sizeThatFits)
    }
}
