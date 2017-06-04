//
//  Monster.swift
//  Shopper's Adventure
//
//  Created by Rachaus on 03/06/17.
//  Copyright © 2017 Rachaus. All rights reserved.
//

import SpriteKit

class Monster: MonsterDataSource, MonsterDelegate {
    var health: Int
    var hitChance: Int
    var monsterType: MonsterType
//    var weapon: Weapon
    var sprite: SKSpriteNode?
    
    required init(health: Int, hitChance: Int) {
        self.health = health
        self.hitChance = hitChance
        monsterType = MonsterType.random() 
//        weapon = Weapon(damage: <#T##Int#>, weaponType: <#T##WeaponType#>)
        sprite = SKSpriteNode(imageNamed: monsterType.spriteName)
    }
    
    required init(health: Int, hitChance: Int, monsterType: MonsterType) {
        self.health = health
        self.hitChance = hitChance
        self.monsterType = monsterType
//        weapon = Weapon()
        sprite = SKSpriteNode(imageNamed: monsterType.spriteName)
    }
    
    func attack() -> Bool {
        // Attack
        
        return true
    }
    
    func die() {
        // Die
    }
}
