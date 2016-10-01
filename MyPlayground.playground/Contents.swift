//: Playground - noun: a place where people can play

import UIKit

class Card {
    var suit: String
    var rank: String
    var cardLabel: String
    var cardValue: UInt {
        for item in faceCardValues {
            if item == self.rank {
                return 10
            }
        }
        if self.rank == "A" {
            return 1
        }
        
        if let rank = UInt(rank) {
            return rank
        }
        return 0
    }
    var description: String { return self.cardLabel }
    
    var faceCardValues = ["J","Q","K"]
    
    init (suit: String, rank: String) {
        self.suit = suit
        self.rank = rank
        self.cardLabel = "\(self.suit)\(self.rank)"
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

func printArrayValues (array: [Card]) {
    var stringToPrint = ""
    for card in array {
        stringToPrint.append("\(card.cardLabel) ")
    }
    print(stringToPrint)
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
        //printArrayValues(array: unsortedArray)
        //checks for rank in order of A-K and adds card to sorted array
        for rank in ranks {
            for card in unsortedArray {
                if card.rank == rank && card.suit == suit {
                    sortedArray.append(card)
                }
            //printArrayValues(array: sortedArray)
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

//"♣︎","♦︎","♥︎","♠︎"
var card1 = Card(suit: "♣︎", rank: "2")
var card2 = Card(suit: "♣︎", rank: "K")
var card3 = Card(suit: "♣︎", rank: "10")
var card4 = Card(suit: "♦︎", rank: "3")
var card5 = Card(suit: "♦︎", rank: "Q")
var card6 = Card(suit: "♦︎", rank: "K")
var card7 = Card(suit: "♥︎", rank: "A")
var card8 = Card(suit: "♥︎", rank: "K")
var card9 = Card(suit: "♥︎", rank: "7")
var card10 = Card(suit: "♥︎", rank: "2")
var card11 = Card(suit: "♠︎", rank: "K")
var card12 = Card(suit: "♠︎", rank: "J")
var myCardArray: [Card] = [card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, card12]

print(descriptionFor(cardArray: myCardArray))


