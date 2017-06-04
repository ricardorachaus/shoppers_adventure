//
//  Weapon.swift
//  Shopper's Adventure
//
//  Created by Rachaus on 30/05/17.
//  Copyright © 2017 Rachaus. All rights reserved.
//

import SpriteKit

protocol WeaponDataSource {
    var damage: Int { get set }
    var weaponType: WeaponType { get set }
    var sprite: SKSpriteNode? { get set }
}
