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
    
    let base = SKSpriteNode(imageNamed: "base")
    let ball = SKSpriteNode(imageNamed: "ball")
    
    var stickActive = false
    
    // MARK: - Init functions
    
    override init(size: CGSize) {
        super.init(size: size)
        
        physicsWorld.contactDelegate = self
//        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.gravity = CGVector(dx: 0, dy: -3.0)
        
        initializeVariables()        
        setAnalogJoystick()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Set the initial value of the attributes
    func initializeVariables() {
        initializeBackground()
        player = Player(position: CGPoint(x: size.width / 2, y: size.height / 2))
        maxPositionX = size.width * 5
        minPositionX = size.width / 2 - 1
        
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
        if (camera?.position.x)! < maxPositionX &&
           (camera?.position.x)! > minPositionX &&
           (player?.position.x)! > minPositionX {
            camera?.position.x = (player?.position.x)!
        }
    }

    // MARK: - Analog joystick methods
    
    // Set the analog sprite to the scene
    func setAnalogJoystick() {
        base.position = CGPoint(x: 80, y: 50)
        ball.position = base.position
        
        base.alpha = 0.4
        ball.alpha = 0.4
        
        base.zPosition = 15
        ball.zPosition = 15
        
        base.size = CGSize(width: size.width / 6, height: size.height / 6)
        ball.size = CGSize(width: size.width / 10, height: size.height / 10)
        
        addChild(base)
        addChild(ball)
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
                ball.position = CGPoint(x: base.position.x - xDist, y: base.position.y + yDist)
                
                toLeft = (ball.position.x < 80) ? true : false
                movePlayer(toLeft: toLeft)
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
    func movePlayer(toLeft: Bool) {
        player?.walk(toLeft: toLeft)
    }
    
}


// MARK: - Touches and update

extension GameScene {
    override func update(_ currentTime: TimeInterval) {
        moveCamera()
    }
    
    // MARK: - Touches methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            setStickActive(location: location)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
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
