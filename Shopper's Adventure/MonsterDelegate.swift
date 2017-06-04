//
//  MonsterDelegate.swift
//  Shopper's Adventure
//
//  Created by Rachaus on 03/06/17.
//  Copyright © 2017 Rachaus. All rights reserved.
//

import SpriteKit

protocol MonsterDelegate {
    init(position: CGPoint, health: Int, hitChance: Int)
    init(position: CGPoint, health: Int, hitChance: Int, monsterType: MonsterType)
    func attack() -> Bool
    func die()
}
