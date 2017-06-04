//
//  Weapon.swift
//  Shopper's Adventure
//
//  Created by Rachaus on 03/06/17.
//  Copyright © 2017 Rachaus. All rights reserved.
//

import SpriteKit

class Weapon: WeaponDataSource, WeaponDelegate {
    var damage: Int
    var weaponType: WeaponType
    var sprite: SKSpriteNode?
    
    init(playerType: PlayerType) {
        damage = 0
        weaponType = WeaponType.random()
        weaponForType(playerType: playerType)
        sprite = SKSpriteNode(imageNamed: weaponType.spriteName)
    }
    
    required init(damage: Int, weaponType: WeaponType) {
        self.damage = damage
        self.weaponType = weaponType
        sprite = SKSpriteNode(imageNamed: weaponType.spriteName)
    }
    
    func attack() -> Bool {
        // Attack
        
        return true
    }
    
    func die() {
        // Die
    }
    
    func weaponForType(playerType: PlayerType) {
        switch playerType {
            
            case .warrior:
                while weaponType != .sword || weaponType != .axe {
                    weaponType = WeaponType.random()
                }
                
            case .archer:
                while weaponType != .dagger || weaponType != .bow {
                    weaponType = WeaponType.random()
            }
            
            case .monk:
                while weaponType != .stick || weaponType != .knife {
                    weaponType = WeaponType.random()
                }
            
            case .mage:
                while weaponType != .scepter {
                    weaponType = WeaponType.random()
                }
        }
    }
}
