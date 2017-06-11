//
//  AudioType.swift
//  Shopper's Adventure
//
//  Created by Rachaus on 29/05/17.
//  Copyright © 2017 Rachaus. All rights reserved.
//

import Foundation

enum AudioType: Int {
    case menu = 0, firstStage
    
    var musicName: String {
        let musicNames = ["The Misadventure Begins", "Final Breath"]
        
        return musicNames[rawValue]
    }
}
