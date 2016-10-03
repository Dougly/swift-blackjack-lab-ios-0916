//
//  Dealer.swift
//  swift-blackjack-lab
//
//  Created by Douglas Galante on 9/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Dealer {
    var deck: Deck = Deck()
    var house: House = House(name: "House")
    var player: House = House(name: "Player")
    var bet: UInt = 0
    
    func place(bet amount: UInt) -> Bool {
        if self.house.tokens >= amount && self.player.tokens >= amount {
            self.bet = amount
            return true
        }
        return false
    }
    
    func deal () {
        self.house.cards = []
        self.player.cards = []
        for i in 0...3 {
            if i < 2 {
                self.house.cards.append(self.deck.drawCard())
            }else {
                self.player.cards.append(self.deck.drawCard())
            }
            
        }
        house.stayed = false
        player.stayed = false
    }
    func turn (house dealer: House) {
        if dealer.mustHit && !dealer.stayed && !dealer.blackjack {
            dealer.cards.append(self.deck.drawCard())
        } else {
            dealer.stayed = true
        }
    }
    
    func winner () -> String {
        let pl = "player"
        let hs = "house"
        switch true {
        case house.busted:
            return pl
        case player.busted:
            return hs
        case house.blackjack:
            return hs
        case player.blackjack && !house.blackjack:
            return pl
        case player.handscore < house.handscore && !house.busted:
            return hs
       case player.stayed && house.stayed  && player.handscore > house.handscore:
            return pl
        case player.handscore == house.handscore && !player.busted  && !house.busted:
            return hs
        case player.cards.count == 5:
            return pl
        default:
            return "no"
        }
    }
    
    func award () -> String{
        switch winner () {
        case "player":
            player.tokens += bet
            house.tokens -= bet
            return "player wins"
        case "house":
            player.tokens -= bet
            house.tokens += bet
            return "house wins"
        default:
            return "no winner"
        }
    }
}

