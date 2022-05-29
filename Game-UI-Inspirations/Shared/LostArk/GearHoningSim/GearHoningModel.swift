//
//  GearHoningModel.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/19/22.
//

import Foundation

// Make a gear honing success calculator

// WIP
protocol Purchasable {
  var goldValue: Int {get}
}

// Classification of gear (T1, T2, T3)
enum Tier {
  case one
  case two
  case threeLow
  case threeMid
}

enum ShardOld {
  case harmony(Int) // T1
  case life(Int) // T2
  case honor(Int) // T3
  
  func value() -> Int {
    switch self {
    case .harmony (let val):
      return val
    case .life(let val):
      return val
    case .honor(let val):
      return val
    }
  }
}

protocol StoneOld {
  func value() -> Int
}

enum RedStoneOld: StoneOld {
  
  case destructionFragment(Int) // T1
  case destruction(Int) // T2
  case destructionCrystal(Int) // T3
  
  func value() -> Int {
    switch self {
    case .destructionFragment (let val):
      return val
    case .destruction(let val):
      return val
    case .destructionCrystal(let val):
      return val
    }
  }
}

enum BlueStoneOld: StoneOld {
  case guardianFragment(Int) // T1
  case guardian(Int) // T2
  case guardianCrystal(Int) // T3
  
  func value() -> Int {
    switch self {
    case .guardianFragment (let val):
      return val
    case .guardian(let val):
      return val
    case .guardianCrystal(let val):
      return val
    }
  }
}

enum FusionMaterialOld {
  case caldarr(Int) // T2
  case simpleOreha(Int) // T3 low
  case basicOreha(Int) // T3 mid
  
  func value() -> Int {
    switch self {
    case .caldarr (let val):
      return val
    case .simpleOreha(let val):
      return val
    case .basicOreha(let val):
      return val
    }
  }
}

enum LeapStoneOld {
  case harmony(Int) // T1 Rare
  case life(Int) // T2 Rare
  case honor(Int) // T3 Rare
  case greatHonor(Int) // T3 Rare (!)
  
  func value() -> Int {
    switch self {
    case .harmony (let val):
      return val
    case .life(let val):
      return val
    case .honor(let val):
      return val
    case .greatHonor(let val):
      return val
    }
  }
}

struct RequiredMaterialCostOld {
  var silver: Int
  var gold: Int = 0
  
  var shards: ShardOld
  var stones: StoneOld
  var leapStones: LeapStoneOld
  var fusionMaterials: FusionMaterialOld?
}

// Material cost per level (this changes!)

//var finished = false
//var tier = Tier.threeMid
//var level = 7
//var attempts = 0
//var materialCosts: [RequiredMaterialCost] = []
//
//while !finished {
//  if GearHoningCalculator.roll(tier: tier, level: level) {
//    level += 1
//  }
//
//  attempts += 1
//  materialCosts.append(GearHoningCalculator.materialCost(tier: tier, level: level)!)
//  if level == 20 {
//    finished = true
//  }
//}
//
//print("Number of attempts: \(attempts)")
//
//let silver = materialCosts.compactMap({$0.silver})
//  .reduce(0, {x, y in
//  x + y
//})
//
//let gold = materialCosts.compactMap({$0.gold})
//  .reduce(0, {x, y in
//  x + y
//})
//
//let shards = materialCosts.compactMap({$0.shards})
//  .reduce(0, {x, y in
//  return x + y.value()
//})
//
//let stones = materialCosts.compactMap({$0.stones})
//  .reduce(0, {x, y in
//  return x + y.value()
//})
//
//let leaps = materialCosts.compactMap({$0.leapStones})
//  .reduce(0, {x, y in
//  return x + y.value()
//})
//
//let fusions = materialCosts.compactMap({$0.fusionMaterials})
//  .reduce(0, {x, y in
//  return x + y.value()
//})
//
//extension Int {
//    func withCommas() -> String {
//        let numberFormatter = NumberFormatter()
//        numberFormatter.numberStyle = .decimal
//        return numberFormatter.string(from: NSNumber(value:self))!
//    }
//}
//
//print("Material cost - silver : \(silver.withCommas())")
//print("Material cost - gold : \(gold.withCommas())")
//print("Material cost - shards : \(shards.withCommas())")
//print("Material cost - stones : \(stones.withCommas())")
//print("Material cost - leaps : \(leaps.withCommas())")
//print("Material cost - fusions : \(fusions.withCommas())")
//
