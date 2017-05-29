//
//  TKBigStickNode.swift
//  FazendoAnalogico
//
//  Created by Matheus Bispo on 21/05/17.
//  Copyright © 2017 MatheusBispo. All rights reserved.
//

import GameplayKit

protocol AnalogJoystickNodeDelegate: class{
    func analogDidMoved(analog: AKBigStickNode, xValue: Float, yValue: Float)
}

public class AKBigStickNode: SKSpriteNode {
    
    //MARK: - Configurations
    var smallNode: SKSpriteNode!
    var trackingDistance: CGFloat!
    
    weak var delegate: AnalogJoystickNodeDelegate?
    
    init(size: CGSize, bigTexture: SKTexture, smallTexture: SKTexture) {

        super.init(texture: bigTexture, color: UIColor.clear, size: size)
        
        self.trackingDistance = size.width/2
        
        let smallNodeSize = CGSize(width: size.width/2, height: size.height/2)
    
        
        smallNode = SKSpriteNode(texture: smallTexture, color: UIColor.clear, size: smallNodeSize)
        
        smallNode.zPosition = self.zPosition + 1
        smallNode.name = "smallNode"
        addChild(smallNode)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        let touchLocation = touches.first?.location(in: self)
        
        var dx = (touchLocation?.x)!
        var dy = (touchLocation?.y)!
        
        let distance = hypot(dx, dy)
        
        if distance > trackingDistance {
            dx = (dx/distance) * trackingDistance
            dy = (dy/distance) * trackingDistance
        }
        
        smallNode.position = CGPoint(x: dx, y: dy)
        
        let normalizedDx = Float(dx / trackingDistance)
        let normalizedDy = Float(dy / trackingDistance)
        
        delegate?.analogDidMoved(analog: self, xValue: normalizedDx, yValue: normalizedDy)
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        resetAnalogStick()
    }
    
    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        resetAnalogStick()
    }
    
    func resetAnalogStick(){
        smallNode.run(SKAction.move(to: CGPoint.zero, duration: 0.2))
        
        delegate?.analogDidMoved(analog: self, xValue: 0, yValue: 0)
    }

}
