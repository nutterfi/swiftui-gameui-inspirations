//
//  GIAchievementView.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 10/26/21.
//

import SwiftUI
import Shapes

struct GIAchievementBorder: NFiShape {
  var inset: CGFloat = .zero
  
  func path(in rect: CGRect) -> Path {
    Path { path in
      let insetRect = rect.insetBy(dx: inset, dy: inset)
      
      let ogeeInset = 0.1 * insetRect.width
      let ogeeInsetY = 0.075 * insetRect.height
      let cornerInset = 0.025 * insetRect.height
      let arcRadius = insetRect.width * 0.05
      
      path.move(to: CGPoint(x: insetRect.minX + ogeeInset, y: insetRect.minY + ogeeInsetY))
      
      path.addOgeeCurve(to: CGPoint(x: insetRect.midX, y: insetRect.minY + 0.01 * insetRect.height), controlX: 0.5)
      path.addOgeeCurve(to: CGPoint(x: insetRect.maxX - ogeeInset, y: insetRect.minY + ogeeInsetY), controlX: 0.5)
      
      // i want to reverse the order of the CGPoints that are being stored in path
      
      path.addLine(to: CGPoint(x: path.currentPoint!.x, y: path.currentPoint!.y + cornerInset))
      
      
      
      path.addArc(center: path.currentPoint!.offsetBy(x: 0, y: arcRadius), radius: arcRadius, startAngle: .radians(-.pi / 2), endAngle: .zero, clockwise: false)
      
      path.addLine(to: CGPoint(x: path.currentPoint!.x + cornerInset, y: path.currentPoint!.y))
      
      // looooong line
      
      let remainderY =  insetRect.height - 2 * (path.currentPoint!.y - insetRect.minY)
      
      path.addLine(to: CGPoint(x: path.currentPoint!.x, y: path.currentPoint!.y + remainderY))
      
      // go in reverse now...
      
      path.addLine(to: CGPoint(x: path.currentPoint!.x - cornerInset, y: path.currentPoint!.y))
      
      path.addArc(center: path.currentPoint!.offsetBy(x: -arcRadius, y: 0), radius: arcRadius, startAngle: .zero, endAngle: .radians(.pi / 2), clockwise: false)
      
      path.addLine(to: CGPoint(x: path.currentPoint!.x, y: path.currentPoint!.y + cornerInset))
      
      path.addOgeeCurve(to: CGPoint(x: insetRect.midX, y: insetRect.maxY - 0.01 * insetRect.height), controlX: 0.5)
      path.addOgeeCurve(to: CGPoint(x: insetRect.minX + ogeeInset, y: insetRect.maxY - ogeeInsetY), controlX: 0.5)
      
      path.addLine(to: CGPoint(x: path.currentPoint!.x, y: path.currentPoint!.y - cornerInset))
      
      path.addArc(center: path.currentPoint!.offsetBy(x: 0, y: -arcRadius), radius: arcRadius, startAngle: .radians(.pi / 2), endAngle: .radians(.pi), clockwise: false)
      
      path.addLine(to: CGPoint(x: path.currentPoint!.x - cornerInset, y: path.currentPoint!.y))
      
      // long line again
      path.addLine(to: CGPoint(x: path.currentPoint!.x, y: path.currentPoint!.y - remainderY))
      
      path.addLine(to: CGPoint(x: path.currentPoint!.x + cornerInset, y: path.currentPoint!.y))
      
      path.addArc(center: path.currentPoint!.offsetBy(x: arcRadius, y: 0), radius: arcRadius, startAngle: .radians(.pi), endAngle: .radians(-.pi / 2), clockwise: false)
      
      path.closeSubpath()
      
    }
  }
  
  
}

struct GIAchievementView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct GIAchievementView_Previews: PreviewProvider {
    static var previews: some View {
      ZStack {
        GIAchievementBorder()
          .fill(Color.black.opacity(0.8))
        GIAchievementBorder()
          .inset(by: 8)
          .fill(Color(red: 79/255, green: 86/255, blue: 102/255))
        GIAchievementBorder()
          .inset(by: 8)
          .stroke(Color("giGold"), lineWidth: 2)
        
        GIAchievementBorder()
          .inset(by: 12)
          .stroke(Color("giGold").opacity(0.5), lineWidth: 1)
        VStack {
          Mora()
            .frame(width: 100, height: 100)
          Text("Wonders of the World")
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .frame(width: 150)
        }
      }
      .frame(width: 200, height: 300)
      .previewLayout(.sizeThatFits)
      .background(LinearGradient(colors: [.blue, .green], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}
