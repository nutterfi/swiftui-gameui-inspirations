import SwiftUI
import Shapes

enum GotgSettings: Identifiable, CaseIterable {
  case controls
  case video
  case audio
  case languages
  case accessibility
  case legal
  case squareEnixMembers
  
  var id: String {
    String(String(describing: self))
  }
  
  var userFacingString: String {
    switch self {
    case .squareEnixMembers:
      return "Square Enix Members".uppercased()
    default:
      return id.uppercased()
    }
  }
}

struct GotgSettingsMenu: View {
  @State private var selectedSetting: GotgSettings = .controls
  
  var selectedOverlay: some View {
    ZStack {
      GuardianFadeTransition()
      Text(selectedSetting.userFacingString).foregroundColor(.black)
    }
  }
  
  func settingItem(setting: GotgSettings) -> some View {
    ZStack(alignment: .leading) {
      Color.white.opacity(0.01)
      Text(setting.userFacingString)
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
    }
    .border(Color.red)
    .frame(height: setting == selectedSetting ? 64 : 32)
    .overlay(
      Group {
        if setting == selectedSetting {
          selectedOverlay
        } else {
          EmptyView()
        }
      }
    )
  }
  
  var body: some View {
    ZStack {
      Color(red: 40/255, green: 9/255, blue: 18/255).ignoresSafeArea()
      VStack(alignment: .leading, spacing: 0) {
        Text("SETTINGS")
          .font(.custom("Impact", size: 80))
          .foregroundColor(Color(red: 228/255, green: 76/255, blue: 91/255))
        ForEach(GotgSettings.allCases) { setting in
          settingItem(setting: setting)
            .onTapGesture {
              selectedSetting = setting
            }
        }
      }
    }
  }
}

struct GotgSettingsMenu_Previews: PreviewProvider {
  static var previews: some View {
    GotgSettingsMenu()
  }
}
