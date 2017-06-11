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
        damage = Int(arc4random_uniform(1000))
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
        let result = Int(arc4random_uniform(2))
        
        switch playerType {
            case .warrior:
                if result == 1 {
                    weaponType = .sword
                }
                else {
                    weaponType = .axe
                }
            
            case .archer:
                if result == 1 {
                    weaponType = .bow
                }
                else {
                    weaponType = .dagger
                }
            
            case .monk:
                if result == 1 {
                    weaponType = .stick
                }
                else {
                    weaponType = .knife
                }
            
            case .mage:
                weaponType = .scepter
        }
    }
}
