//
//  MonsterDelegate.swift
//  Shopper's Adventure
//
//  Created by Rachaus on 03/06/17.
//  Copyright © 2017 Rachaus. All rights reserved.
//

import Foundation

protocol MonsterDelegate {
    init(health: Int, hitChance: Int)
    init(health: Int, hitChance: Int, monsterType: MonsterType)
    func attack() -> Bool
    func die()
}
