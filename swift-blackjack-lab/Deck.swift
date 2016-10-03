//
//  Deck.swift
//  swift-blackjack-lab
//
//  Created by Douglas Galante on 9/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Deck {
    var dealtCards: [Card] = []
    var cardsInDeck: [Card]
    var description: String { return "Cards Remaining: \(cardsInDeck.count)/n Cards Dealt: \(dealtCards.count)"}
    
    
    init () {
        
        func validRanks () -> [String] {
            var allRanks: [String] = ["K", "J", "Q", "A"]
            for i in 2...10 {
                allRanks.append(String(i))
            }
            return allRanks
        }
        
        let suits = ["♣︎","♠︎","♥︎","♦︎"]
        let ranks = validRanks()
        var fullDeck: [Card] = []
        
        for suit in suits {
            for rank in ranks {
                let card = Card(suit: suit, rank: rank)
                fullDeck.append(card)
            }
        }
        self.cardsInDeck = fullDeck
    }
    
    func drawCard () -> Card {
        dealtCards.append(cardsInDeck[0])
        cardsInDeck.remove(at: 0)
        return dealtCards[0]
    }
    
    func shuffle () {
        
        var shuffledDeck: [Card] = []
        for _ in cardsInDeck {
            let ranNumInRange = Int(arc4random_uniform(UInt32(cardsInDeck.count)))
            shuffledDeck.append(cardsInDeck[ranNumInRange])
            cardsInDeck.remove(at: ranNumInRange)
        }
        self.cardsInDeck = shuffledDeck
    }
}
