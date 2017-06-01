//
//  Player.swift
//  Shopper's Adventure
//
//  Created by Rachaus on 29/05/17.
//  Copyright © 2017 Rachaus. All rights reserved.
//

import SpriteKit

class Player: GameObject {
    let playerTexture: SKTexture?
    var health: Int = 0
    var weapon: Weapon?
    var shield: Shield?
    var playerType: PlayerType = .warrior
    var level: Int = 0
    var exp: Int = 0
    
    init(position: CGPoint) {
        playerTexture = SKTexture(imageNamed: "2")
        playerTexture?.filteringMode = .nearest
        
        super.init(position: position, texture: playerTexture!)
        setupPhysicsBody()
        
        name = "player"
        zPosition = 15
        setScale(4)
        
        run(SKAction.animate(with: [playerTexture!], timePerFrame: 0.1))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Physics and movements

extension Player: PlayerProtocol {
    // Seting the physics of the player
    func setupPhysicsBody() {
        self.physicsBody = SKPhysicsBody(rectangleOf: (playerTexture?.size())!)
        self.physicsBody?.affectedByGravity = true
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.categoryBitMask = CollisionType.player.rawValue
        self.physicsBody?.collisionBitMask = CollisionType.ground.rawValue
    }
    
    // Move the player
    func walk(toLeft: Bool) {
        if toLeft {
            position.x -= 7
            xScale = -xScale
        }
        else {
            position.x += 7
        }
    }
}
