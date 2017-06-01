//
//  Monster.swift
//  Shopper's Adventure
//
//  Created by Rachaus on 01/06/17.
//  Copyright © 2017 Rachaus. All rights reserved.
//

import SpriteKit

protocol Monster {
    var health: Int { get set }
    var hitChance: Int { get set }
    var monsterType: MonsterType { get set }
    var sprite: SKSpriteNode? { get set }
    
    init(health: Int, hitChance: Int)
    init(health: Int, hitChance: Int, monsterType: MonsterType)
    func attack() -> Bool
    func die()
}
