//
//  Player.swift
//  swift-blackjack-lab
//
//  Created by Douglas Galante on 9/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Player {
    var name: String
    var cards: [Card] = []
    var handscore: UInt { return getScore() }
    var blackjack: Bool { return self.handscore == 21 && self.cards.count == 2 }
    var busted: Bool { return self.handscore > 21 }
    var stayed: Bool = false
    var mayHit: Bool { return !busted && !blackjack && !stayed }
    var tokens: UInt
    var description: String {
        return "Player: \(name)\n Cards: \(cards)\n Handscore: \(handscore)\n Blackjack: \(blackjack)\n Busted: \(busted)\n Stayed: \(stayed)\n Tokens: \(tokens)"
    }
    
    init (name: String) {
        self.name = name
        self.tokens = 100
    }
    
    private func getScore () -> UInt {
        var totalScore: UInt = 0
        
        for card in self.cards {
            totalScore += card.cardValue
        }
        
        for card in self.cards {
            if totalScore <= 11 && card.rank == "A" {
                totalScore += 10
            }
        }
        return totalScore
    }
    
    func canPlace(bet uInt: UInt) -> Bool {
        return uInt <= tokens
    }
    
    func didWin(bet uInt: UInt) {
        self.tokens += uInt
    }
    func didLose(bet uInt: UInt) {
        self.tokens -= uInt
    }
    
}
