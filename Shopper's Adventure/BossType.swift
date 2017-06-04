//
//  BossType.swift
//  Shopper's Adventure
//
//  Created by Rachaus on 03/06/17.
//  Copyright © 2017 Rachaus. All rights reserved.
//

import Foundation

enum BossType: Int {
    case king_skeleton = 0, cyclop, dragon
    
    var spriteName: String {
        let spriteNames = ["king_skelenton", "cyclop", "dragon"]
        
        return spriteNames[rawValue]
    }
    
    static func random() -> BossType {
        return BossType(rawValue: Int(arc4random_uniform(3)))!
    }
}
