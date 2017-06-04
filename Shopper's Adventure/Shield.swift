//
//  Shield.swift
//  Shopper's Adventure
//
//  Created by Rachaus on 03/06/17.
//  Copyright © 2017 Rachaus. All rights reserved.
//

import SpriteKit

class Shield: ShieldDataSource, ShieldDelegate {
    var blockChance: Int
    
    required init() {
        blockChance = 0
    }
    
    required init(blockChance: Int) {
        self.blockChance = blockChance
    }
}
