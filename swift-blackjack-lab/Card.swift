//
//  Card.swift
//  swift-blackjack-lab
//
//  Created by Douglas Galante on 9/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Card {
    let suit: String
    let rank: String
    let cardLabel: String
    var cardValue: UInt = 0
    var description: String { return self.cardLabel }
    
    init (suit: String, rank: String) {
        self.suit = suit
        self.rank = rank
        self.cardLabel = "\(self.suit)\(self.rank)"
        self.cardValue = getCardValue()
    }
    
    private func getCardValue () -> UInt {
        switch rank {
        case "A": return 1
        case "K", "Q", "J": return 10
        default: return UInt(rank)!
        }
    }
    
    func validSuits () -> [String]{
        return ["♣︎","♦︎","♥︎","♠︎"]
        }
    
    func validRanks () -> [String] {
        var allRanks: [String] = ["A", "J", "Q", "K"]
        for i in 2...10 {
            allRanks.append(String(i))
        }
        return allRanks
    }
}

func descriptionFor (cardArray cards: [Card]) -> String {
    let suits = ["♣︎","♦︎","♥︎","♠︎"]
    let ranks = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    
    var sortedString = ""
    var unsortedArray = [Card]()
    var sortedArray = [Card]()
    
    for suit in suits {
        sortedArray = []
        unsortedArray = []
        //adds 1 suit of cards to unsorted array
        for card in cards {
            if card.suit == suit {
                unsortedArray.append(card)
            }
        }
        //checks for rank in order of A-K and adds card to sorted array
        for rank in ranks {
            for card in unsortedArray {
                if card.rank == rank && card.suit == suit {
                    sortedArray.append(card)
                }
            }
        }
        //adds cards in order to string. If it is the last card in the array it starts a new line
        for (index,card) in sortedArray.enumerated() {
            if index + 1 < sortedArray.count {
                sortedString.append("\(card.cardLabel), ")
            }else if index + 1 == sortedArray.count {
                sortedString.append("\(card.cardLabel)\n")
            }
        }
    }
    return sortedString
}

