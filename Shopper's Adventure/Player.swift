//
//  Player.swift
//  Shopper's Adventure
//
//  Created by Rachaus on 29/05/17.
//  Copyright © 2017 Rachaus. All rights reserved.
//

import SpriteKit

class Player: GameObject, PlayerDataSource {
    let playerTexture: SKTexture?
    var health: Int = 0
    var weapon: Weapon
    var shield: Shield?
    var playerType: PlayerType = PlayerType.random()
    var level: Int = 0
    var exp: Int = 0
    
    init(position: CGPoint) {
        playerTexture = SKTexture(imageNamed: playerType.spriteName)
        playerTexture?.filteringMode = .nearest
        weapon = Weapon(playerType: playerType)
        
        super.init(position: position, texture: playerTexture!)
        setupPhysicsBody()
        
        name = "player"
        zPosition = 15
        setScale(4)
        health = 30
        
        run(SKAction.animate(with: [playerTexture!], timePerFrame: 0.1))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Physics and movements

extension Player {
    // Seting the physics of the player
    func setupPhysicsBody() {
        physicsBody = SKPhysicsBody(rectangleOf: (playerTexture?.size())!)
        physicsBody?.affectedByGravity = true
        physicsBody?.allowsRotation = false
        physicsBody?.categoryBitMask = CollisionType.player.rawValue
        physicsBody?.collisionBitMask = CollisionType.ground.rawValue
        physicsBody?.contactTestBitMask = CollisionType.enemy.rawValue
    }
    
    // Move the player
    func walk(toLeft: Bool) {
        if toLeft {
            position.x -= 9
            xScale = -fabs(xScale)
        }
        else {
            position.x += 9
            xScale = fabs(xScale)
        }
    }
    
    // Make the player jump
    func jump(_ isJumping: Bool) {
        if isJumping {
            position.y += 30
            position.x += 9
        }
    }
}
