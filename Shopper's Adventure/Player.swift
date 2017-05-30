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
    
    init(position: CGPoint) {
        playerTexture = SKTexture(imageNamed: "2")
        playerTexture?.filteringMode = .nearest
        
        super.init(position: position, texture: playerTexture!)
        setupPhysicsBody()
        self.name = "player"
        self.zPosition = 15
        self.setScale(3)
        run(SKAction.animate(with: [playerTexture!], timePerFrame: 0.1))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupPhysicsBody() {
        self.physicsBody = SKPhysicsBody(rectangleOf: (playerTexture?.size())!)
        self.physicsBody?.affectedByGravity = true
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.categoryBitMask = CollisionType.player.rawValue
        self.physicsBody?.collisionBitMask = CollisionType.ground.rawValue
    }
}
