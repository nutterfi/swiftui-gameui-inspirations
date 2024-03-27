//
//  SpriteKitDemo.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 1/22/22.
//

import SwiftUI
import SpriteKit
import Shapes

class GameScene: SKScene {
  override func didMove(to view: SKView) {
    physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard let touch = touches.first else { return }
    let location = touch.location(in: self)
    let box = SKSpriteNode(color: SKColor.red, size: CGSize(width: 50, height: 50))
    box.position = location
    box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 50))
    addChild(box)
  }
}

struct SpriteKitDemo: View {
  
  var scene: SKScene {
    let scene = GameScene()
    scene.size = CGSize(width: 300, height: 400)
    scene.scaleMode = .fill
    return scene
  }
  
  var gradient = RadialGradient(colors: [Color.purple, .blue], center: .center, startRadius: 0, endRadius: 300)
  
  var buttonView: some View {
    HStack {
      Circle()
        .foregroundColor(.blue)
      Spacer()
      Circle()
        .foregroundColor(.red)
    }
    .background(Color.white.opacity(0.01)) //
  }
  
  var body: some View {
    GeometryReader { proxy in
      let dim = min(proxy.size.width, proxy.size.height)
      ZStack {
        ZStack {
          SpriteView(scene: scene)
        }
        
        buttonView
          .border(Color.black, width: 10)
          .frame(width: dim * 0.5, height: dim * 0.1)
          .offset(x: -dim * 0.5, y: 0)
      }
      .frame(width: proxy.size.width, height: proxy.size.height)
    }
  }
}

struct SpriteKitDemo_Previews: PreviewProvider {
    static var previews: some View {
        SpriteKitDemo()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
