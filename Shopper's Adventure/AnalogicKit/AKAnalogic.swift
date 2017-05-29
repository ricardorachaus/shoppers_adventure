//
//  BKAnalogic.swift
//  FazendoAnalogico
//
//  Created by Matheus Bispo on 21/05/17.
//  Copyright © 2017 MatheusBispo. All rights reserved.
//

import GameplayKit

public struct AnalogicData{
    public var velocity = CGPoint.zero
    public var angle = CGFloat(0)
}

public protocol AKAnalogicDataDelegate: class {
    func analogicDataUpdated(analogicData: AnalogicData)
}

public class AKAnalogic: SKSpriteNode {
    
    private var bigStickNode : AKBigStickNode!
    public var data = AnalogicData()

    public weak var delegate: AKAnalogicDataDelegate?
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    
        self.setup()
    }
    
    func setup() {
        guard let sizeValue : Double = self.userData?.value(forKey: "Size") as? Double else{
            fatalError("The Value for key 'Size' can't be casted for Double type")
        }
        
        guard let bigTextureValue : String = self.userData?.value(forKey: "BigTexture") as? String else{
            fatalError("The Value for key 'BigTexture' can't be casted for String type")
        }
        
        guard let smallTextureValue : String = self.userData?.value(forKey: "SmallTexture") as? String else{
            fatalError("The Value for key 'SmallTexture' can't be casted for String type")
        }
        
        let bigTexture = SKTexture(imageNamed: bigTextureValue)
        let smallTexture = SKTexture(imageNamed: smallTextureValue)
        
        let size = CGSize(width: sizeValue, height: sizeValue)
        
        bigStickNode = AKBigStickNode(size: size, bigTexture: bigTexture, smallTexture: smallTexture)
    
        bigStickNode.delegate = self
        
        self.addChild(bigStickNode)
    }
    
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        bigStickNode.touchesMoved(touches, with: event)
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        bigStickNode.touchesEnded(touches, with: event)
    }
    
    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        bigStickNode.touchesCancelled(touches, with: event)
    }

    
}

extension AKAnalogic : AnalogJoystickNodeDelegate{
    func analogDidMoved(analog: AKBigStickNode, xValue: Float, yValue: Float) {
        data.velocity = CGPoint(x: CGFloat(xValue), y: CGFloat(yValue))
        data.angle = CGFloat(-atan2(xValue, yValue))
        
        delegate?.analogicDataUpdated(analogicData: data)
    }
}
