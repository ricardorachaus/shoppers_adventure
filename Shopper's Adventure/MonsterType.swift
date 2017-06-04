//
//  MonsterType.swift
//  Shopper's Adventure
//
//  Created by Rachaus on 30/05/17.
//  Copyright © 2017 Rachaus. All rights reserved.
//

import Foundation

enum MonsterType: Int {
    case knight = 0, cowboy, unknown
    
    var spriteName: String {
        let spriteNames = ["3", "5", "4"]
        
        return spriteNames[rawValue]
    }
    
    static func random() -> MonsterType {
        return MonsterType(rawValue: Int(arc4random_uniform(3)))!
    }
}
