//
//  GameScene.swift
//  Shopper's Adventure
//
//  Created by Rachaus on 28/05/17.
//  Copyright © 2017 Rachaus. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreGraphics

class GameScene: SKScene, SKPhysicsContactDelegate {
    var player: Player?
    var mainCamera: SKCameraNode?
    var maxPositionX: CGFloat = 0
    var minPositionX: CGFloat = 0
    var currentBallXPosition: CGFloat = 0
    var jumpBallPosition: CGFloat = 0
    
    let base = SKSpriteNode(imageNamed: "base")
    let ball = SKSpriteNode(imageNamed: "ball")
    
    var stickActive = false
    
    // MARK: - Init functions
    
    override init(size: CGSize) {
        super.init(size: size)
        
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector(dx: 0, dy: -3.0)
        
        initializeVariables()        
        setAnalogJoystick()
        showLife()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Set the initial value of the attributes
    func initializeVariables() {
        initializeBackground()
        player = Player(position: CGPoint(x: size.width / 4, y: size.height / 2))
        maxPositionX = size.width * 5
        minPositionX = size.width / 2 - 1
        
        mainCamera = SKCameraNode()
        camera = mainCamera
        mainCamera?.position = CGPoint(x: size.width / 2, y: size.height / 2)
        currentBallXPosition = (mainCamera?.position.x)!
        
        let monster1 = Monster(position: GameScene.randomPosition(), health: Int(arc4random_uniform(100)), hitChance: Int(arc4random_uniform(100)))
        let monster2 = Monster(position: GameScene.randomPosition(), health: Int(arc4random_uniform(100)), hitChance: Int(arc4random_uniform(100)))
        let monster3 = Monster(position: GameScene.randomPosition(), health: Int(arc4random_uniform(100)), hitChance: Int(arc4random_uniform(100)))

        monster1.zPosition = 15
        monster2.zPosition = 15
        monster3.zPosition = 15
        
        addChild(player!)
        addChild(mainCamera!)
        addChild(monster1)
        addChild(monster2)
        addChild(monster3)
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
        if (mainCamera?.position.x)! < maxPositionX &&
           (mainCamera?.position.x)! > minPositionX &&
           (player?.position.x)! > minPositionX {
            mainCamera?.position.x = (player?.position.x)!
        }
    }

    // MARK: - Joystick methods
    
    // Set the analog sprite to the scene
    func setAnalogJoystick() {
        base.position = CGPoint(x: -size.width * 0.4, y: -size.height * 0.4)
        ball.position = base.position
        
        currentBallXPosition = ball.position.x - 10
        jumpBallPosition = -size.height * 0.4
        
        base.alpha = 0.6
        ball.alpha = 0.6
        
        base.zPosition = 15
        ball.zPosition = 15
        
        base.size = CGSize(width: size.width / 6, height: size.height / 6)
        ball.size = CGSize(width: size.width / 10, height: size.height / 10)
        
        mainCamera?.addChild(base)
        mainCamera?.addChild(ball)
    }
    
    
    // Set the value if the stick is active
    func setStickActive(location: CGPoint) {
        if ball.frame.contains(location) {
            stickActive = true
        }
        else {
            stickActive = false
        }
    }
    
    // Move the stick sprite
    func moveAnalogStick(location: CGPoint) {
        var toLeft: Bool
        var jump: Bool
        
        if stickActive {
            let vector = CGVector(dx: location.x - base.position.x, dy: location.y - base.position.y)
            let angle = atan2(vector.dy, vector.dx)
            let length: CGFloat = base.frame.size.height / 8
            let xDist: CGFloat = sin(angle - 1.5707963268) * length
            let yDist: CGFloat = cos(angle - 1.5707963268) * length
            
            if base.frame.contains(location) {
                ball.position = location
            }
            else {
                currentBallXPosition = base.position.x
                ball.position = CGPoint(x: base.position.x - xDist, y: base.position.y + yDist)
                
                toLeft = (ball.position.x < currentBallXPosition) ? true : false
                jump = (ball.position.y > jumpBallPosition) ? true : false
                movePlayer(toLeft: toLeft, isJumping: jump)
            }
        }
    }
    
    // Move the stick sprite to idle position after touch
    func moveAnalogStickToIdlePosition() {
        if stickActive {
            let move = SKAction.move(to: base.position, duration: 0.2)
            move.timingMode = .easeOut
            ball.run(move)
        }
    }
    
    // MARK: - Players actions methods
    
    // Move the player
    func movePlayer(toLeft: Bool, isJumping: Bool) {
        if !isJumping {
            player?.walk(toLeft: toLeft)
        }
        else {
            player?.jump(isJumping)
        }
    }
    
    // MARK: - HUD
    
    // Show player life
    func showLife() {
        let heartPosition = CGPoint(x: -size.width / 2.2, y: size.height / 2.4)
        
        for index in 0..<3 {
            let heartSprite = SKSpriteNode(imageNamed: "heart")
            heartSprite.position = CGPoint(x: heartPosition.x + CGFloat(index) * size.width / 16, y: size.height / 2.4)
            heartSprite.zPosition = 15
            heartSprite.setScale(3)
            heartSprite.name = "heart\(index)"
            
            mainCamera?.addChild(heartSprite)
        }
    }
    
    static func randomPosition() -> CGPoint {
        return CGPoint(x: CGFloat(arc4random_uniform(1000)), y: CGFloat(arc4random_uniform(50) + 100))
    }
    
}


// MARK: - Touches and update

extension GameScene {
    override func update(_ currentTime: TimeInterval) {
        moveCamera()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self.mainCamera!)
            setStickActive(location: location)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self.mainCamera!)
            moveAnalogStick(location: location)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        moveAnalogStickToIdlePosition()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        moveAnalogStickToIdlePosition()
    }
}
