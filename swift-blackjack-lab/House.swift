//
//  House.swift
//  swift-blackjack-lab
//
//  Created by Douglas Galante on 9/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class House : Player {
    var mustHit: Bool { return self.handscore < 17 }
    
    override init (name: String) {
        super.init(name: name)
        self.tokens = 1000
    }
    
}
