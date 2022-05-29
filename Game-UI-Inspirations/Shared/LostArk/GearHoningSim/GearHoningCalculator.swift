//
//  GearHoningCalculator.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 5/19/22.
//

import Foundation

protocol LostArkItem {
  var id: String { get set }
  var count: Int { get set }
}

// required number of mats
struct Shard: Decodable, LostArkItem {
  var id: String
  var count: Int
}

struct Stone: Decodable, LostArkItem {
  var id: String
  var count: Int
}

struct LeapStone: Decodable, LostArkItem {
  var id: String
  var count: Int
}

struct FusionMaterial: Decodable, LostArkItem {
  var id: String
  var count: Int
}

struct TargetHone: Decodable {
  var id: String
  var gearType: String // "armor", "weapon"
  var rank: String // 1, 2, 3, etc.
  var tier: String // 1, 2, 3
  var itemLevel: String // e.g. 320
}

/**
 "successRate" :
 {
   "base" : 0.03,
   "additional" : [
     {
       "id" : "star_breath",
       "rateIncrease" : 0.05,
       "maximum" : 2
     },
     {
       "id" : "solar_grace", // T3
       "rateIncrease" : 0.05,
       "maximum" : 2
     },
     {
       "id" : "solar_blessing", // T3
       "rateIncrease" : 0.05,
       "maximum" : 2
     }
   ]
 }
 */

struct AdditionalMaterial: Decodable {
  var id: String
  var value: Double
  var maximum: Int
}

struct SuccessRate: Decodable {
  var id: String
  var base: Double
  var failureBonusPercentageOfBaseline: Double
  var additional: [AdditionalMaterial]
}

//  plist -> JSON -> Decodable

struct RequiredMaterials: Decodable {
  var silver: Int
  var gold: Int = 0
  
  var shards: Shard
  var stones: Stone
  var leapStones: LeapStone
  var fusionMaterials: FusionMaterial?
}

struct HoningAttempt: Decodable {
  var id: String
  var target: TargetHone
  var materials: RequiredMaterials
  var successRate: SuccessRate
}

struct GearHoningCalculator {
  typealias levelRate = [Int: Double]
  typealias levelRequiredCost = [Int: RequiredMaterialCostOld]
  
  static func roll(tier: Tier, level: Int, additionalChance: Double = 0.0) -> Bool {
    let baseSuccessRate = GearHoningCalculator.successRate(tier: tier, level: level)
    let finalSuccessRate = baseSuccessRate + additionalChance
    return Double.random(in: 0...1) >= 1 - finalSuccessRate
  }
  
  static func load() {
    guard let url = Bundle.main.url(forResource: "requiredMaterials", withExtension: "json") else { return }
    do {
      let data = try Data(contentsOf: url)
      let decoder = JSONDecoder()
      let myData = try decoder.decode([String: RequiredMaterials].self, from: data)
      print(myData)
    } catch {
        print("whoopsadaisy")
    }
    
  }
  
  static func materialCost(tier: Tier, level: Int) -> RequiredMaterialCostOld? {
    // TODO: Fill this out... oh man so much data, I need a spreadsheet
    // Based on T3 Mid Armor (1340)
    let tierThreeMid: levelRequiredCost = [
      7: RequiredMaterialCostOld(silver: 96332, gold: 170, shards: .honor(4730), stones: BlueStoneOld.guardianCrystal(404), leapStones: .greatHonor(8), fusionMaterials: .basicOreha(6)),
      8: RequiredMaterialCostOld(silver: 96872, gold: 170, shards: .honor(4730), stones: BlueStoneOld.guardianCrystal(404), leapStones: .greatHonor(10), fusionMaterials: .basicOreha(6)),
      9: RequiredMaterialCostOld(silver: 97432, gold: 170, shards: .honor(4730), stones: BlueStoneOld.guardianCrystal(404), leapStones: .greatHonor(10), fusionMaterials: .basicOreha(6)),
      
      10: RequiredMaterialCostOld(silver: 69640, gold: 170, shards: .honor(5832), stones: BlueStoneOld.guardianCrystal(498), leapStones: .greatHonor(10), fusionMaterials: .basicOreha(8)),
      
      11: RequiredMaterialCostOld(silver: 70240, gold: 170, shards: .honor(5832), stones: BlueStoneOld.guardianCrystal(498), leapStones: .greatHonor(10), fusionMaterials: .basicOreha(8)),
      
      12: RequiredMaterialCostOld(silver: 70840, gold: 170, shards: .honor(5832), stones: BlueStoneOld.guardianCrystal(498), leapStones: .greatHonor(12), fusionMaterials: .basicOreha(8)),
      
      13: RequiredMaterialCostOld(silver: 80084, gold: 170, shards: .honor(6936), stones: BlueStoneOld.guardianCrystal(592), leapStones: .greatHonor(12), fusionMaterials: .basicOreha(8)),
      
      14: RequiredMaterialCostOld(silver: 80724, gold: 170, shards: .honor(6936), stones: BlueStoneOld.guardianCrystal(592), leapStones: .greatHonor(12), fusionMaterials: .basicOreha(8)),
      
      15: RequiredMaterialCostOld(silver: 81384, gold: 180, shards: .honor(6936), stones: BlueStoneOld.guardianCrystal(592), leapStones: .greatHonor(12), fusionMaterials: .basicOreha(8)),
      
      16: RequiredMaterialCostOld(silver: 174668, gold: 210, shards: .honor(9394), stones: BlueStoneOld.guardianCrystal(686), leapStones: .greatHonor(14), fusionMaterials: .basicOreha(10)),
      
      17: RequiredMaterialCostOld(silver: 226916, gold: 250, shards: .honor(12698), stones: BlueStoneOld.guardianCrystal(686), leapStones: .greatHonor(16), fusionMaterials: .basicOreha(10)),
      
      18: RequiredMaterialCostOld(silver: 298224, gold: 280, shards: .honor(17220), stones: BlueStoneOld.guardianCrystal(686), leapStones: .greatHonor(16), fusionMaterials: .basicOreha(12)),
      
      19: RequiredMaterialCostOld(silver: 400316, gold: 320, shards: .honor(23702), stones: BlueStoneOld.guardianCrystal(780), leapStones: .greatHonor(18), fusionMaterials: .basicOreha(14)),
      
      20: RequiredMaterialCostOld(silver: 533744, gold: 350, shards: .honor(32192), stones: BlueStoneOld.guardianCrystal(780), leapStones: .greatHonor(20), fusionMaterials: .basicOreha(14))
    ]
    return tierThreeMid[level]
  }
  
  static func successRate(tier: Tier, level: Int) -> Double {
    // ideally we would grab the info from a csv file instead of switch statements
    let tier1And2: levelRate = [
      1: 1,
      2: 1,
      3: 1,
      4: 1,
      5: 1,
      6: 1,
      7: 0.9,
      8: 0.9,
      9: 0.8,
      10: 0.8,
      11: 0.7,
      12: 0.7,
      13: 0.6,
      14: 0.5,
      15: 0.4,
      16: 0.3,
      17: 0.2,
      18: 0.15,
      19: 0.1,
      20: 0.05
    ]
    
    let tier3: levelRate = [
      1: 1,
      2: 1,
      3: 1,
      4: 1,
      5: 1,
      6: 1,
      7: 0.6,
      8: 0.45,
      9: 0.3,
      10: 0.3,
      11: 0.3,
      12: 0.15,
      13: 0.15,
      14: 0.15,
      15: 0.1,
      16: 0.1,
      17: 0.1,
      18: 0.05,
      19: 0.05,
      20: 0.03
    ]
    
    switch tier {
    case .one, .two:
      return tier1And2[level] ?? 0
    case .threeLow, .threeMid:
      return tier3[level] ?? 0
    }
  }
  
}
