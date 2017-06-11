//
//  Monster.swift
//  Shopper's Adventure
//
//  Created by Rachaus on 03/06/17.
//  Copyright © 2017 Rachaus. All rights reserved.
//

import SpriteKit

class Monster: GameObject, MonsterDataSource, MonsterDelegate {
    var health: Int
    var hitChance: Int
    var monsterType: MonsterType
    var monsterTexture: SKTexture?
    
    required init(position: CGPoint, health: Int, hitChance: Int) {
        self.health = health
        self.hitChance = hitChance
        monsterType = MonsterType.random()
        monsterTexture = SKTexture(imageNamed: monsterType.spriteName)
        
        super.init(position: position, texture: monsterTexture!)
        setupPhysicsBody()
        
        name = "monster"
        zPosition = 15
        setScale(4)
    }
    
    required init(position: CGPoint, health: Int, hitChance: Int, monsterType: MonsterType) {
        self.health = health
        self.hitChance = hitChance
        self.monsterType = monsterType
        monsterTexture = SKTexture(imageNamed: monsterType.spriteName)
        super.init(position: position, texture: monsterTexture!)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func attack() -> Bool {
        // Attack
        
        return true
    }
    
    func die() {
        // Die
    }
    
    static func randomPosition() -> CGPoint {
        return CGPoint(x: CGFloat(arc4random_uniform(2000) + 200),
                       y: CGFloat(arc4random_uniform(100) + 100))
    }
}

// MARK: - Physics and movements

extension Monster {
    // Seting the physics of the player
    func setupPhysicsBody() {
        physicsBody = SKPhysicsBody(rectangleOf: (monsterTexture?.size())!)
        physicsBody?.affectedByGravity = true
        physicsBody?.allowsRotation = false
        physicsBody?.categoryBitMask = CollisionType.enemy.rawValue
        physicsBody?.collisionBitMask = CollisionType.ground.rawValue
        physicsBody?.contactTestBitMask = CollisionType.player.rawValue
    }
}
