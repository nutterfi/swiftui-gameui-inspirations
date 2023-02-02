import SwiftUI
import Shapes

extension Color {
  static let arkhamPurple = Color(red: 151/255, green: 154/255, blue: 191/255)
}

struct ArkhamAsylumHUD: View {
  @State private var health = 0.5
  @State private var amount = 100.0
  
  var body: some View {
    VStack {
      Slider(value: $health)
        .foregroundColor(.white)
      Slider(value: $amount, in: 0.0...300)
        .foregroundColor(.white)
      
      ZStack {
        Color(red: 130/255, green: 23/255, blue: 8/255).opacity(0.8)
        
        SpongeFilter(
          base: BatmanLogo()
            .rotation(.degrees(-20)),
          size: 1, stencil: Circle()
        )
        .foregroundColor(.black.opacity(0.8))
        .frame(width: 256, height: 175)
        
        let hatching = Hatching(spacing: 20, angle: .degrees(90), lineWidth: 8)
        
        SpongeFilter(base: hatching, amount: Int(amount), size: 75, stencil: BatmanLogo())
          .rotation(.degrees(45))
          .clipShape(Circle().inset(by: 35))
        
        // Health bar
        Group {
          Circle()
            .overlay(
              Circle()
                .inset(by: 50)
                .trim(from: 0, to: 0.48 * health)
                .rotation(.degrees(120))
                .stroke(Color.white, lineWidth: 20)
            )
            .clipShape(
              Circle() // just for framing
                .inset(by: 50)
                .trim(from: 0, to: 0.48)
                .rotation(.degrees(120))
                .stroke(lineWidth: 20)
            )
          
          Circle() // just for framing
            .inset(by: 50)
            .trim(from: 0, to: 0.48)
            .rotation(.degrees(120))
            .stroke(lineWidth: 20)
            .stroke(Color.gray)
        }
        
        // UGH Copy Paste
        // EXP Bar
        Group {
          Circle()
            .overlay(
              Circle()
                .inset(by: 70)
                .trim(from: 0, to: 0.5)
                .rotation(.degrees(-90))
                .stroke(Color.arkhamPurple, lineWidth: 10)
            )
            .clipShape(
              Circle() // just for framing
                .inset(by: 70)
                .rotation(.degrees(-90))
                .stroke(lineWidth: 10)
            )
          
          Circle() // just for framing
            .inset(by: 50)
            .trim(from: 0, to: 0.48)
            .rotation(.degrees(120))
            .stroke(lineWidth: 20)
            .stroke(Color.gray)
        }
        
        // XP Labels
        VStack {
          Group {
            Text("1020")
            Text("+ 100")
          }
          .font(.system(size: 25))
        }
        .foregroundColor(.white)
        .rotationEffect(.degrees(-5))
      }
      .frame(width: 256, height: 256)
      Spacer()
    }
  }
}

struct ArkhamAsylumHUD_Previews: PreviewProvider {
  static var previews: some View {
    ArkhamAsylumHUD()
      .previewLayout(.sizeThatFits)
  }
}
