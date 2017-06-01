//
//  Weapon.swift
//  Shopper's Adventure
//
//  Created by Rachaus on 30/05/17.
//  Copyright © 2017 Rachaus. All rights reserved.
//

import SpriteKit

protocol Weapon {
    var damage: Int { get set }
    var weaponType: WeaponType { get set }
    var sprite: SKSpriteNode? { get set }
    
    init()
    init(damage: Int, weaponType: WeaponType)
    func attack() -> Bool
    func die()
}
