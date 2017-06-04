//
//  Monster.swift
//  Shopper's Adventure
//
//  Created by Rachaus on 01/06/17.
//  Copyright © 2017 Rachaus. All rights reserved.
//

import SpriteKit

protocol MonsterDataSource {
    var health: Int { get set }
    var hitChance: Int { get set }
    var monsterType: MonsterType { get set }
//    var weapon: Weapon { get set }
    var monsterTexture: SKTexture? { get set }
}
