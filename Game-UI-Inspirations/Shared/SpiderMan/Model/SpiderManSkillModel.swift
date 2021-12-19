//
//  SpiderManSkillModel.swift
//  Game-UI-Inspirations
//
//  Created by nutterfi on 12/2/21.
//

import Foundation

/// The requirements for unlocking a skill
struct SpiderManSkillRequirements {
  var characterLevel: Int
  var tier: Int // not really needed?
  var requiredSkillIds: [String]
  var cost: Int
}

/// The current availabilty state of a given skill
enum SpiderManSkillAvailability {
  case hidden // locked-unknown
  case locked // not purchased
  case unlocked // purchased, active, owned.
}

// The current data snapshot for a given skill, including its requirements and its active state
struct SpiderManSkillState {
  var skill: SpiderManSkill
  var requirements: SpiderManSkillRequirements
  var availability: SpiderManSkillAvailability
}

// Factory for grouping SpiderManSkillBlobs
struct SpiderManSkillTree: Identifiable {
  var id = UUID()
  var skills: [SpiderManSkillState] = []
  
  init() {
    buildSkills()
  }
  
  mutating func buildSkills() {
    let tier1Skill = SpiderManSkill.sample
    let tier1Reqs = SpiderManSkillRequirements(characterLevel: 1, tier: 1, requiredSkillIds: [], cost: 1)
    let tier1Blob = SpiderManSkillState(skill: tier1Skill, requirements: tier1Reqs, availability: .unlocked)
    
    let tier2Skill = SpiderManSkill(id: "venom2", type: .venom, name: "Venom Leap", description: "Some Description")
    let tier2Reqs = SpiderManSkillRequirements(characterLevel: 4, tier: 2, requiredSkillIds: ["venom1"], cost: 1)
    let tier2Blob = SpiderManSkillState(skill: tier2Skill, requirements: tier2Reqs, availability: .unlocked)
    
    let tier2SkillB = SpiderManSkill(id: "venom2B",type: .venom, name: "Venom Dash", description: "Some Description")
    let tier2ReqsB = SpiderManSkillRequirements(characterLevel: 4, tier: 2, requiredSkillIds: ["venom2"], cost: 1)
    let tier2BlobB = SpiderManSkillState(skill: tier2SkillB, requirements: tier2ReqsB, availability: .locked)
    
    let tier2SkillC = SpiderManSkill(id: "venom2C",type: .venom, name: "Venom Skip", description: "Some Description")
    let tier2ReqsC = SpiderManSkillRequirements(characterLevel: 4, tier: 2, requiredSkillIds: ["venom2"], cost: 1)
    let tier2BlobC = SpiderManSkillState(skill: tier2SkillC, requirements: tier2ReqsC, availability: .locked)

    let tier3Skill = SpiderManSkill(id: "venom3",type: .venom, name: "Venom Crash", description: "Some Description")
    let tier3Reqs = SpiderManSkillRequirements(characterLevel: 7, tier: 3, requiredSkillIds: ["venom2"], cost: 1)
    let tier3Blob = SpiderManSkillState(skill: tier3Skill, requirements: tier3Reqs, availability: .locked)
    
    let tier3SkillB = SpiderManSkill(id: "venom3B",type: .venom, name: "Venom Hop", description: "Some Description")
    let tier3ReqsB = SpiderManSkillRequirements(characterLevel: 7, tier: 3, requiredSkillIds: ["venom3"], cost: 1)
    let tier3BlobB = SpiderManSkillState(skill: tier3SkillB, requirements: tier3ReqsB, availability: .locked)

    let tier3SkillC = SpiderManSkill(id: "venom3C",type: .venom,  name: "Venom Sweep", description: "Some Description")
    let tier3ReqsC = SpiderManSkillRequirements(characterLevel: 7, tier: 3, requiredSkillIds: ["venom3"], cost: 1)
    let tier3BlobC = SpiderManSkillState(skill: tier3SkillC, requirements: tier3ReqsC, availability: .locked)
    
    let tier4Skill = SpiderManSkill(id: "venom4",type: .venom,  name: "Venom Bomb", description: "Some Description")
    let tier4Reqs = SpiderManSkillRequirements(characterLevel: 10, tier: 4, requiredSkillIds: ["venom3"], cost: 1)
    let tier4Blob = SpiderManSkillState(skill: tier4Skill, requirements: tier4Reqs, availability: .hidden)

    skills = [tier1Blob, tier2Blob, tier2BlobB, tier2BlobC, tier3Blob, tier3BlobB, tier3BlobC, tier4Blob]
  }
}

/// WIP
struct SpiderManSkillModel {
  
  //  CRUD - Create, read, update, destroy
  
  // returns the current active state of all skills
  var allSkills: [SpiderManSkillState] {
      return []
  }
  
  var venomTree = SpiderManSkillTree()
  var combatTree = SpiderManSkillTree()
  var cloakTree = SpiderManSkillTree()
  
  private(set) var skills: [String: SpiderManSkillState] = [:]
  
  private(set) var skillPoints = 10
  
  mutating func buildTrees() {
    venomTree.buildSkills()
    combatTree.buildSkills()
    cloakTree.buildSkills()
    
    venomTree.skills.forEach { blob in
      skills[blob.skill.id] = blob
    }
  }
  
  mutating func unlockSkill(id: String) {
    // find the node wherever that is and deduct the skill cost from skillPoints
    guard var skillBlob = skills[id],
    skillBlob.availability != .unlocked,
          skillPoints >= skillBlob.requirements.cost else { return }
    
    skillPoints -= skillBlob.requirements.cost
    skillBlob.availability = .unlocked
    skills[id] = skillBlob
  }
  
  mutating func reset() {
    buildTrees()
    skillPoints = 10
  }
}

// What if we imported a JSON string and parsed it to get the skills info?
let skillJSon = """
[
  {
    "id" : "venom2B",
      ...
    "requirements" : {
      "skillIDs" : [
        "venom2"
      ],
      "cost" : 1,
      "characterLevel" : 4
    }

  },
  {...}
]

"""
