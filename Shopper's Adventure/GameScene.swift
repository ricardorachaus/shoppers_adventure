//
//  GameScene.swift
//  Shopper's Adventure
//
//  Created by Rachaus on 28/05/17.
//  Copyright © 2017 Rachaus. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var player: Player?
    var mainCamera: SKCameraNode?
    var maxPositionX: CGFloat = 0
    
    // MARK: - Init functions
    
    override init(size: CGSize) {
        super.init(size: size)
        
        physicsWorld.contactDelegate = self
//        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.gravity = CGVector(dx: 0, dy: -3.0)
        
        initializeVariables()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Set the initial value of the attributes
    func initializeVariables() {
        initializeBackground()
        player = Player(position: CGPoint(x: size.width / 2, y: size.height / 2))
        maxPositionX = size.width * 5
        
        mainCamera = SKCameraNode()
        camera = mainCamera
        mainCamera?.position = CGPoint(x: size.width / 2, y: size.height / 2)
        
        addChild(player!)
        addChild(mainCamera!)
    }
    
    // Create all the stage background
    func initializeBackground() {
        for count in 0...5 {
            let newBackground = FirstStageBackgroundLayer(size: size)
            newBackground.position = CGPoint(x: size.width * CGFloat(count), y: newBackground.position.y)
            
            addChild(newBackground)
        }
    }
    
    // MARK: - Camera methods
    
    // Move the camera along the player
    func moveCamera() {
        if (camera?.position.x)! < maxPositionX {
            camera?.position.x = (player?.position.x)!
        }
    }
    
}


// MARK: - Touches and update

extension GameScene {
    override func update(_ currentTime: TimeInterval) {
        moveCamera()
    }
}
