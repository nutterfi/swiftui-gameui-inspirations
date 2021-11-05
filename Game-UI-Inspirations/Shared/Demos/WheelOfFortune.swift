//
//  WheelOfFortune.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 11/4/21.
//

import SwiftUI
import Shapes

class WheelOfFortuneViewModel: ObservableObject {
  @Published var games: [String] = []
  
  var data: [String] {
    [
      Games.mgsv, Games.control, Games.mk11, Games.rdr2, Games.genshinImpact, Games.overwatch, Games.swtor, Games.tlou, Games.hades, Games.detroit, Games.destiny2, Games.celeste, Games.re7, "Shapes"
    ]
  }
  
  func reset() {
    games = data.shuffled()
  }
}

struct WheelOfFortune: View {
  @StateObject private var viewModel = WheelOfFortuneViewModel()
  @State private var isAnimating = false
  @State private var showTitle = false
  
  var body: some View {
    VStack {
      Button {
        viewModel.reset()
        isAnimating.toggle()
        showTitle = false
        
        withAnimation(Animation.easeInOut(duration: 10)) {
          isAnimating.toggle()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 9) {
          showTitle = true
        }
        
      } label: {
        Arrowhead()
          .frame(width: 128, height: 128)
          .rotationEffect(.degrees(180))
      }
      
      GeometryReader { proxy in
        let dim = min(proxy.size.width, proxy.size.height)
        ZStack {
          Circle().fill(RadialGradient(colors:  [.blue, .black], center: .center, startRadius: 0, endRadius: dim))
          let rect = CGRect(origin: .zero, size: CGSize(width: dim, height: dim))
          let points = ConvexPolygon(sides: viewModel.games.count)
            .vertices(in: rect.insetBy(dx: dim * 0.1, dy: dim * 0.1))
          ForEach(0..<points.count, id:\.self) { index in
            let point = points[index]
            segmentView(for: viewModel.games[index])
              .frame(width: dim * 0.2, height: dim * 0.2)
            
              .offset(x: -dim * 0.5 + point.x, y: -dim * 0.5 + point.y)
          }
          
          if showTitle {
            Text(viewModel.games.first ?? "")
              .font(.system(size:60))
              .foregroundColor(.white)
          }
          
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
        .rotationEffect(.degrees(isAnimating ? 360 * 10 : 0))
      }
      .background(Color.black)
      .onAppear {
        viewModel.reset()
      }
    }
  }
  
  func segmentView(for game: String) -> some View {
    Group {
      switch game {
      case Games.control:
        LoadingRingsView(color: .white, lineWidth: 8)
      case Games.mk11:
        HStack(spacing: 10) {
          MK11Left()
            .fill(LinearGradient(colors: [.red, .black], startPoint: .top, endPoint: .bottom))
              .frame(width: 30)
          
          MK11Right()
            .fill(LinearGradient(colors: [.red, .black], startPoint: .top, endPoint: .bottom))
              .frame(width: 30)
        }
        .frame(width: 120, height: 120)
      case Games.overwatch:
        OverwatchIcon(primary: Color.white, secondary: Color.orange)
      case Games.swtor:
        SWTOREmpireLogo(color: Color.purple)
      case Games.rdr2:
        RDR2RevolverLoadingAnimation().foregroundColor(.red)
      case Games.genshinImpact:
        Mora()
      case Games.tlou:
        FireflyPendant()
      case Games.hades:
        LinearGradient(gradient: Gradient(colors: [.hadesAresRed, .white, .hadesAresRed, .hadesAresRed]), startPoint: .topLeading, endPoint: .bottomTrailing)
          .mask(
            AresBoon()
          )
      case Games.destiny2:
        Destiny2FastTravelIcon(color: .white)
      case Games.detroit:
        DBHTitleScreenMenuItem(title:"").frame(width:120)
      case Games.celeste:
        CelesteDeathAnimation()
      case Games.mgsv:
        DiamondDogsLogo()
      case "Shapes":
        KiteAnimationDemo()
        
      default:
        Text(game)
          .font(.largeTitle)
          .frame(maxWidth: .infinity, minHeight: 120)
          .foregroundColor(.white)
          .background(Color.red)
      }
      
    }
    .frame(width: 160, height: 120)
  }
}

struct WheelOfFortune_Previews: PreviewProvider {
  static var previews: some View {
    WheelOfFortune()
  }
}
