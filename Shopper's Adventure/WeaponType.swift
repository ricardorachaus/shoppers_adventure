//
//  WeaponType.swift
//  Shopper's Adventure
//
//  Created by Rachaus on 30/05/17.
//  Copyright © 2017 Rachaus. All rights reserved.
//

import Foundation

enum WeaponType: Int {
    case sword = 0, axe, knife, stick, bow, dagger, scepter
    
    var spriteName: String {
        let spriteNames = ["sword", "axe", "knife", "stick", "bow", "dagger", "scepter"]
        
        return spriteNames[rawValue]
    }
    
    static func random() -> WeaponType {
        return WeaponType(rawValue: Int(arc4random_uniform(7)))!
    }
}
